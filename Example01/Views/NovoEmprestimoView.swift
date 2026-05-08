
import SwiftUI

struct NovoEmprestimoView: View {
    @Environment(\.dismiss) private var dismiss
    var existing: Emprestimo? = nil
    var onSave: (Emprestimo) -> Void

    @State private var pessoa: String
    @State private var descricao: String
    @State private var valorText: String
    @State private var dataEmprestimo: Date
    @State private var dataCobranca: Date
    @State private var forma: String

    private let formas = ["Dinheiro", "Pix", "Transferência", "Cartão", "Outro"]

    init(existing: Emprestimo? = nil, onSave: @escaping (Emprestimo) -> Void) {
        self.existing = existing
        self.onSave = onSave
        _pessoa = State(initialValue: existing?.pessoa ?? "")
        _descricao = State(initialValue: existing?.descricao ?? "")
        if let v = existing?.valor {
            _valorText = State(initialValue: String(format: "%.2f", v))
        } else {
            _valorText = State(initialValue: "")
        }
        _dataEmprestimo = State(initialValue: existing?.dataEmprestimo ?? Date())
        _dataCobranca = State(initialValue: existing?.dataCobranca ?? (Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()))
        _forma = State(initialValue: existing?.forma ?? "Dinheiro")
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Para quem?") {
                    TextField("Nome da pessoa", text: $pessoa)
                }
                Section("Detalhes") {
                    TextField("Descrição (ex: livro, ferramenta)", text: $descricao)
                    TextField("Valor (R$)", text: $valorText)
                        .keyboardType(.decimalPad)
                    Picker("Forma", selection: $forma) {
                        ForEach(formas, id: \.self) { Text($0) }
                    }
                }
                Section("Datas") {
                    DatePicker("Data do empréstimo", selection: $dataEmprestimo, displayedComponents: [.date])
                    DatePicker("Data para cobrar", selection: $dataCobranca, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                }
            }
            .navigationTitle(existing == nil ? "Novo empréstimo" : "Editar empréstimo")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(existing == nil ? "Salvar" : "Atualizar") { salvar() }
                        .disabled(!podeSalvar)
                }
            }
        }
    }

    private var podeSalvar: Bool {
        guard !pessoa.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return false }
        guard Double(valorText.replacingOccurrences(of: ",", with: ".")) != nil else { return false }
        return true
    }

    private func salvar() {
        let valor = Double(valorText.replacingOccurrences(of: ",", with: ".")) ?? 0
        let novo = Emprestimo(id: existing?.id ?? UUID(), pessoa: pessoa, descricao: descricao, valor: valor, dataEmprestimo: dataEmprestimo, dataCobranca: dataCobranca, forma: forma)
        onSave(novo)
        dismiss()
    }
}

#Preview {
    NovoEmprestimoView(
        existing:
           Emprestimo(
                pessoa: "Fulano",
                descricao: "Comprar uma roupa",
                valor: 200.00,
                dataEmprestimo: Date(),
                dataCobranca: Date(),
                forma: "Pix"
            )
        ){ emprestimo in
            print("Realizei um empréstimo")
        }
}
