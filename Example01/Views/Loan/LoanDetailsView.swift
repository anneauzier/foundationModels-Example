//
//  LoanDetailsView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct LoanDetailsView: View {

    let loan: Loan

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                LoanHeaderCard(loan: loan)

//                LoanTimelineView()

                LoanActionsView()

                InstallmentsSection(
                    installments: loan.installments
                )
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}
