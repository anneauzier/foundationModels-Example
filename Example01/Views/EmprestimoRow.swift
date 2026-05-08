import SwiftUI

struct EmprestimoRow: View {
    let emprestimo: Emprestimo

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(emprestimo.pessoa).font(.headline)
                Spacer()
                Text("R$ \(emprestimo.valor, format: .number.precision(.fractionLength(2)))")
                    .font(.headline)
            }
            Text(emprestimo.descricao).foregroundStyle(.secondary)
            HStack(spacing: 12) {
                Label(emprestimo.forma, systemImage: "creditcard")
                Label {
                    Text(emprestimo.dataEmprestimo, style: .date)
                } icon: {
                    Image(systemName: "calendar")
                }
                Label {
                    Text(emprestimo.dataCobranca, style: .date)
                } icon: {
                    Image(systemName: "bell")
                }
            }
            .labelStyle(.iconOnly)
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    EmprestimoRow(
        emprestimo: Emprestimo(
            pessoa: "Fulano",
            descricao: "Comprar uma roupa",
            valor: 200.00,
            dataEmprestimo: Date(),
            dataCobranca: Date(),
            forma: "Pix"
        )
    )
}
