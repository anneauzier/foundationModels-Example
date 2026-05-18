
import Foundation
import FoundationModels

final class EmprestimoGenerator {

    private var session: LanguageModelSession
    let emprestimo: Emprestimo
    
    let instructions = ""
    
    init(emprestimo: Emprestimo) {
        self.emprestimo = emprestimo
        self.session = LanguageModelSession(instructions: instructions)
    }
    
    
}
