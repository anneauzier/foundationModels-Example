//
//  LoanInstallment.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import Foundation

struct LoanInstallment: Identifiable, Codable, Hashable {
    let id: UUID

    var amount: Decimal
    var dueDate: Date

    var paidAt: Date?

    init(
        id: UUID = UUID(),
        amount: Decimal,
        dueDate: Date,
        paidAt: Date? = nil
    ) {
        self.id = id
        self.amount = amount
        self.dueDate = dueDate
        self.paidAt = paidAt
    }
}