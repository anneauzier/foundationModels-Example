
import SwiftUI
import Combine
import UserNotifications

@MainActor
final class EmprestimosViewModel: ObservableObject {
    
    @Published private(set) var emprestimos: [Emprestimo] = [] {
        didSet { save() }
    }

    private let storageKey = "emprestimos_storage_v1"

    init() {
        load()
        Task { await Notifier.requestAuthorization() }
    }

    func add(_ e: Emprestimo) {
        emprestimos.append(e)
        Task { await Notifier.scheduleReminder(for: e) }
    }
    
    func update(_ e: Emprestimo) {
        if let idx = emprestimos.firstIndex(where: { $0.id == e.id }) {
            let old = emprestimos[idx]
            emprestimos[idx] = e
            Task {
                // Cancel old reminder and schedule new one if date changed or to refresh
                await Notifier.cancelReminder(id: old.id)
                await Notifier.scheduleReminder(for: e)
            }
        }
    }

    func remove(at offsets: IndexSet) {
        let ids = offsets.map { emprestimos[$0].id }
        emprestimos.remove(atOffsets: offsets)
        Task { for id in ids { await Notifier.cancelReminder(id: id) } }
    }

    // Persistência simples em UserDefaults
    private func save() {
        do {
            let data = try JSONEncoder().encode(emprestimos)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            print("Erro ao salvar: \(error)")
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return }
        do {
            emprestimos = try JSONDecoder().decode([Emprestimo].self, from: data)
        } catch {
            print("Erro ao carregar: \(error)")
        }
    }
}
