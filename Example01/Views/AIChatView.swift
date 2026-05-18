//
//  AIChatView.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import SwiftUI

/// Tela principal do assistente conversacional.
///
/// Essa será provavelmente a tela mais importante
/// para estudar Foundation Models.
///
/// Aqui futuramente você pode:
/// - integrar streaming responses
/// - tool calling
/// - memória contextual
/// - OCR
/// - respostas estruturadas
struct AIChatView: View {

    /// Texto digitado pelo usuário.
    @State private var message = ""

    /// Histórico de mensagens.
    let messages: [ChatMessage]

    var body: some View {
        VStack {

            /// Lista de mensagens da conversa.
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(messages) { message in
                        ChatBubbleView(message: message)
                    }
                }
                .padding()
            }

            /// Campo de input.
            ChatInputBar(
                text: $message
            ) {

                /// Aqui futuramente você poderá:
                /// - enviar prompt para o model
                /// - chamar tools
                /// - salvar contexto
                /// - iniciar streaming
            }
        }
        .navigationTitle("Assistente")
    }
}