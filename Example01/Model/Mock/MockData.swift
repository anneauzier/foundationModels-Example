//
//  MockData.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import Foundation

enum MockData {

    static let borrower = Borrower(
        name: "Lucas"
    )

    static let loans: [Loan] = [
        Loan(
            borrower: borrower,
            principalAmount: 1200,
            createdAt: .now,
            interestModel: .cdi(percent: 100)
        )
    ]

    static let messages: [ChatMessage] = [
        ChatMessage(
            role: .assistant,
            content: "Como posso ajudar hoje?"
        ),
        ChatMessage(
            role: .user,
            content: "Quanto o Lucas me deve hoje?"
        )
    ]

    static let insights: [Insight] = [
        Insight(
            title: "Maior risco",
            message: "Lucas está há 32 dias sem movimentações."
        ),
        Insight(
            title: "Rendimento estimado",
            message: "Seus empréstimos renderiam R$ 240 em CDI este mês."
        )
    ]
}