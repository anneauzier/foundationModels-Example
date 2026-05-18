
import Foundation
import FoundationModels
import Playgrounds

#Playground {

//    func formatDate(year: Int, month: Int, day: Int) -> Date {
//        var components = DateComponents()
//        components.year = year
//        components.month = month
//        components.day = day
//        return Calendar.current.date(from: components)!
//    }

    let emprestimo = Emprestimo(
         pessoa: "Eduardo",
        descricao: "Valor emprestado para comprar um celular",
        valor: 3000,
        dataEmprestimo: Date(),
        dataCobranca: Date(),
        forma: "Caixinha"
    )

    let valorEmprestado: Double = emprestimo.valor

    let dataEmprestimo: Date = emprestimo.dataEmprestimo
    let dataCobranca = emprestimo.dataCobranca

    let instructions = """
    You are a financial assistant specializing in Brazilian fixed income.

    FORMULA (mandatory — do not deviate):
      A = P × (1 + CDI_annual)^(working_days / 252)
      
      Where:
      - CDI_annual is the decimal rate (e.g. 14.83% → 0.1483)
      - working_days: estimate business days (Mon–Fri, excluding BR holidays)
      - Base: 252 working days per year (Brazilian standard)
      - Do NOT use (1 + r/n)^(n×t) — this formula is WRONG for CDI

    INCOME TAX (IR):
      - Apply ONLY over gross return (A - P), never over total value A
      - Term ≤ 180 days → IR = 22.5%
      - Net return = gross return × (1 - 0.225)
      - Final value = P + net return

    OUTPUT rules:
      - All monetary values rounded to 2 decimal places
      - Show each step: working days, factor, gross return, IR, net return, final value
      - If any input is missing or invalid, explain the limitation
    """

    let prompt = """
    Loan data:
    - Amount: R$ \(valorEmprestado)
    - Loan date: \(dataEmprestimo)
    - Billing date: \(dataCobranca)
    - Assumed annual CDI rate: 14.83% p.a. (= 0.1483 in decimal)

    Task: Calculate the net return for this period assuming 100% CDI. Show:

    1) Estimated working days between the two dates (Mon–Fri, approx)
    2) Factor applied: (1 + 0.1483)^(working_days / 252)
    3) Gross return = Amount × (Factor − 1)
    4) IR = Gross return × 22.5%  ← apply ONLY over the return, NOT over total
    5) Net return = Gross return − IR
    6) Final accumulated value = Amount + Net return
    """
    
//    let session = LanguageModelSession(instructions: instructions)
//    let result = try await session.respond(to: prompt, generating: String.self)
    
    let session = LanguageModelSession(instructions: instructions)
    do {
        let result = try await session.respond(to: prompt, generating: String.self)
        print(result.content)
    } catch let error as LanguageModelSession.GenerationError {
        print("GenerationError: \(error)")
    } catch {
        print("Erro: \(error)")
    }
    
}

//Você é um assistente financeiro. Calcule rendimentos líquidos com base em CDI anual informado, considerando dias corridos entre as datas.
//- Use juros compostos proporcionais ao período (base 252 dias úteis quando apropriado; se não houver calendário de dias úteis, assuma proporcionalidade contínua sobre dias corridos).
//- Explique brevemente a fórmula utilizada e mostre o valor final arredondado a 2 casas decimais.
//- Responda em português do Brasil, de forma objetiva.
//- Se algum dado estiver ausente ou inválido, explique a limitação.

//Dados do empréstimo:
//- Valor: R$ \(amount)
//- Data do empréstimo: \(dataEmprestimo)
//- Data de cobrança: \(dataCobranca)
//- Taxa CDI anual assumida: 14,83% a.a.
//
//Tarefa: Calcule o rendimento líquido que esse valor teria obtido no período entre a data do empréstimo e a data de cobrança, assumindo aplicação com 100% do CDI. Apresente:
//1) Período considerado (em dias)
//2) Fórmula/critério usado para proporcionalidade da taxa
//3) Rendimento líquido estimado (R$) e valor final acumulado (R$)
