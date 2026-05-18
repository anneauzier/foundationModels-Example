//
//  LoanHeaderCard.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct LoanHeaderCard: View {

    let loan: Loan

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text(loan.borrower.name)
                .font(.title.bold())

            VStack(alignment: .leading, spacing: 8) {

                Label(
                    loan.principalAmount.formatted(.currency(code: "BRL")),
                    systemImage: "banknote"
                )

                Label(
                    loan.createdAt.formatted(date: .abbreviated, time: .omitted),
                    systemImage: "calendar"
                )
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}