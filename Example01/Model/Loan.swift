//
//  Loan 2.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import Foundation

/// Representa um empréstimo realizado para alguém.
///
/// Essa model deve conter apenas os dados do empréstimo.
/// Evite colocar regras de negócio aqui.
///
// Empréstimo
struct Loan: Identifiable, Codable, Hashable {

    /// Identificador único do empréstimo.
    let id: UUID

    /// Pessoa que recebeu o empréstimo.
    var borrower: Borrower

    /// Valor original emprestado.
    var principalAmount: Decimal

    /// Data em que o empréstimo foi criado.
    var createdAt: Date

    /// Data limite esperada para pagamento.
    var dueDate: Date?

    /// Última atualização do empréstimo.
    /// Pode ser útil para sincronização e histórico.
    var lastUpdatedAt: Date

    /// Modelo de juros utilizado.
    /// Exemplo:
    /// - CDI
    /// - Juros fixos
    /// - Modelo customizado
    var interestModel: InterestModel

    /// Estado atual do empréstimo.
    var status: LoanStatus

    /// Observações opcionais.
    var notes: String?

    /// Lista de parcelas.
    /// Mesmo que inicialmente o app não tenha parcelamento,
    /// vale deixar preparado.
    var installments: [LoanInstallment]

    init(
        id: UUID = UUID(),
        borrower: Borrower,
        principalAmount: Decimal,
        createdAt: Date,
        dueDate: Date? = nil,
        lastUpdatedAt: Date = .now,
        interestModel: InterestModel,
        status: LoanStatus = .active,
        notes: String? = nil,
        installments: [LoanInstallment] = []
    ) {
        self.id = id
        self.borrower = borrower
        self.principalAmount = principalAmount
        self.createdAt = createdAt
        self.dueDate = dueDate
        self.lastUpdatedAt = lastUpdatedAt
        self.interestModel = interestModel
        self.status = status
        self.notes = notes
        self.installments = installments
    }
}