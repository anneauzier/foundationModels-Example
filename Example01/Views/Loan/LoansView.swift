//
//  LoansView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct LoansView: View {

    let loans: [Loan]

    var body: some View {
        NavigationStack {
            List(loans) { loan in
                NavigationLink {
                    LoanDetailsView(loan: loan)
                } label: {
                    LoanRowView(loan: loan)
                }
            }
            .navigationTitle("Empréstimos")
        }
    }
}