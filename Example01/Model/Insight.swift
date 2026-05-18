//
//  Insight.swift
//  Example01
//
//  Created by Anne Auzier on 18/05/26.
//


import Foundation

/// Representa um insight gerado para o usuário.
///
/// Exemplos:
/// - risco de atraso
/// - rendimento estimado
/// - comportamento financeiro
/// - recomendações da IA
///
// Insights da IA
struct Insight: Identifiable, Hashable {

    /// Identificador único.
    let id: UUID

    /// Título curto do insight.
    var title: String

    /// Descrição detalhada.
    var message: String

    /// Data de geração.
    var createdAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        message: String,
        createdAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.message = message
        self.createdAt = createdAt
    }
}
