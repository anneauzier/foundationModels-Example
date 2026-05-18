
import SwiftUI
import FoundationModels

struct Emprestimo: Identifiable, Codable {
    let id: UUID
    var pessoa: String
    var descricao: String
    var valor: Double
    var dataEmprestimo: Date
    var dataCobranca: Date
    var forma: String

    init(id: UUID = UUID(), pessoa: String, descricao: String, valor: Double, dataEmprestimo: Date, dataCobranca: Date, forma: String) {
        self.id = id
        self.pessoa = pessoa
        self.descricao = descricao
        self.valor = valor
        self.dataEmprestimo = dataEmprestimo
        self.dataCobranca = dataCobranca
        self.forma = forma
    }
}

@Generable
struct CDIReturn {
    @Guide(description: "Valor a ser cobrado depois do cálculos de juro")
    var valorRetorno: Double
    
    @Guide(description: "Explicação do cálculo de juros e outras informações importantes")
    var explicacao: String
}

//extension EmprestimoDTO {
//    func convertEmprestimoDTO() -> Emprestimo? {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy HH:mm"
//        
//        guard let dataEmprestimo = formatter.date(from: dataEmprestimo) else { return nil }
//        guard let dataCobranca = formatter.date(from: dataCobranca) else { return nil }
//        
//        return Emprestimo(
//            pessoa: pessoa,
//            descricao: descricao,
//            valor: valor,
//            dataEmprestimo: dataEmprestimo,
//            dataCobranca: dataCobranca,
//            forma: forma
//        )
//    }
//}
