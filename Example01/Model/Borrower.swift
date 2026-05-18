//
//  Borrower.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import Foundation

// Emprestante
struct Borrower: Identifiable, Codable, Hashable {
    let id: UUID

    var name: String

    var riskLevel: BorrowerRiskLevel

    var createdAt: Date

    init(
        id: UUID = UUID(),
        name: String,
        riskLevel: BorrowerRiskLevel = .unknown,
        createdAt: Date = .now
    ) {
        self.id = id
        self.name = name
        self.riskLevel = riskLevel
        self.createdAt = createdAt
    }
}
