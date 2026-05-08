
import SwiftUI
import FoundationModels

struct Emprestimo: Identifiable, Codable, Equatable {
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
