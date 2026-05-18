//
//  LoanActionsView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct LoanActionsView: View {

    var body: some View {
        VStack(spacing: 12) {

            Button("Gerar cobrança") {

            }
            .buttonStyle(.borderedProminent)

            Button("Registrar pagamento") {

            }
            .buttonStyle(.bordered)

            Button("Pedir análise da IA") {

            }
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity)
    }
}