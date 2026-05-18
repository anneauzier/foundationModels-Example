//
//  RootView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

/// Container principal do app.
///
/// Responsável por organizar as tabs principais.
struct RootView: View {

    var body: some View {
        TabView {

            /// Tela inicial.
            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            /// Lista completa de empréstimos.
            LoansView(loans: MockData.loans)
                .tabItem {
                    Label("Empréstimos", systemImage: "banknote")
                }

            /// Assistente conversacional com IA.
            AIChatView(messages: MockData.messages)
                .tabItem {
                    Label("Assistente", systemImage: "brain")
                }

            /// Tela de insights.
            InsightsView(insights: MockData.insights)
                .tabItem {
                    Label("Insights", systemImage: "sparkles")
                }
        }
    }
}