//
//  Loan.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//






import Foundation

enum LoanStatus: String, Codable, CaseIterable {
    case active
    case paid
    case overdue
    case archived
}

import Foundation

enum BorrowerRiskLevel: String, Codable, CaseIterable {
    case low
    case medium
    case high
    case unknown
}

enum InterestModel: Codable, Hashable {
    case cdi(percent: Double)
    case fixedMonthly(percent: Double)
    case custom(description: String)
}



import Foundation

struct ChatMessage: Identifiable, Hashable {
    let id: UUID

    var role: ChatRole
    var content: String

    var createdAt: Date

    init(
        id: UUID = UUID(),
        role: ChatRole,
        content: String,
        createdAt: Date = .now
    ) {
        self.id = id
        self.role = role
        self.content = content
        self.createdAt = createdAt
    }
}

import Foundation

enum ChatRole: String, Hashable {
    case user
    case assistant
    case system
}

import SwiftUI

/// Tela principal do aplicativo.
///
/// Objetivo:
/// - Mostrar visão geral dos empréstimos
/// - Mostrar insights rápidos
/// - Dar acesso rápido às ações principais
struct DashboardView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    /// Card principal mostrando total emprestado.
                    TotalBalanceCard()

                    /// Atalhos rápidos.
                    /// Ex:
                    /// - criar empréstimo
                    /// - abrir chat IA
                    /// - cobrar alguém
                    QuickActionsView()

                    /// Lista resumida de empréstimos ativos.
//                    ActiveLoansSection()

                    /// Insights gerados pela IA futuramente.
//                    InsightsSection()
                }
                .padding()
            }
            .navigationTitle("AI Loan Assistant")
        }
    }
}

import SwiftUI

struct TotalBalanceCard: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Total emprestado")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("R$ 12.400")
                .font(.largeTitle.bold())

            Text("+ R$ 342 estimados em rendimento")
                .font(.footnote)
                .foregroundStyle(.green)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

import SwiftUI

struct InstallmentsSection: View {

    let installments: [LoanInstallment]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Parcelas")
                .font(.title3.bold())

            ForEach(installments) { installment in

                HStack {
                    VStack(alignment: .leading) {

                        Text(
                            installment.amount.formatted(
                                .currency(code: "BRL")
                            )
                        )

                        Text(
                            installment.dueDate.formatted(
                                date: .abbreviated,
                                time: .omitted
                            )
                        )
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Image(systemName: installment.paidAt == nil ? "clock" : "checkmark.circle.fill")
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
    }
}





struct InsightCard: View {

    let insight: Insight

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Label(insight.title, systemImage: "sparkles")
                .font(.headline)

            Text(insight.message)
                .font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


