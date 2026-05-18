//
//  InsightsView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct InsightsView: View {

    let insights: [Insight]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {

                    ForEach(insights) { insight in
                        InsightCard(insight: insight)
                    }
                }
                .padding()
            }
            .navigationTitle("Insights")
        }
    }
}
