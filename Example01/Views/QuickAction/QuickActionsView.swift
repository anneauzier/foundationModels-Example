//
//  QuickActionsView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct QuickActionsView: View {

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {

            QuickActionCard(
                title: "Novo empréstimo",
                icon: "plus.circle.fill"
            )

            QuickActionCard(
                title: "Insights",
                icon: "sparkles"
            )

            QuickActionCard(
                title: "Assistente IA",
                icon: "brain"
            )
        }
    }
}