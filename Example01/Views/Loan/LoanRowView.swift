//
//  LoanRowView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct LoanRowView: View {

    let loan: Loan

    var body: some View {
        HStack(spacing: 16) {

            Circle()
                .fill(.blue.opacity(0.2))
                .frame(width: 52, height: 52)
                .overlay {
                    Text(String(loan.borrower.name.prefix(1)))
                        .font(.headline)
                }

            VStack(alignment: .leading, spacing: 6) {
                Text(loan.borrower.name)
                    .font(.headline)

                Text(loan.status.rawValue.capitalized)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(loan.principalAmount.formatted(.currency(code: "BRL")))
                .font(.headline)
        }
        .padding(.vertical, 8)
    }
}