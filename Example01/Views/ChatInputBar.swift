//
//  ChatInputBar.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//

import SwiftUI

struct ChatInputBar: View {

    @Binding var text: String

    let onSend: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            TextField(
                "Pergunte algo...",
                text: $text,
                axis: .vertical
            )
            .textFieldStyle(.roundedBorder)

            Button {
                onSend()
            } label: {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 34))
            }
        }
        .padding()
    }
}
