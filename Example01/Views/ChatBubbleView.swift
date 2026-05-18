//
//  ChatBubbleView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

struct ChatBubbleView: View {

    let message: ChatMessage

    var isUser: Bool {
        message.role == .user
    }

    var body: some View {
        HStack {

            if isUser {
                Spacer()
            }

            Text(message.content)
                .padding()
                .background(
                    isUser
                    ? Color.blue
                    : Color(.secondarySystemBackground)
                )
                .foregroundStyle(
                    isUser
                    ? .white
                    : .primary
                )
                .clipShape(RoundedRectangle(cornerRadius: 18))

            if !isUser {
                Spacer()
            }
        }
    }
}