
import SwiftUI
import Combine
import UserNotifications

enum Notifier {
    static func requestAuthorization() async {
        do {
            let granted = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
            if !granted {
                print("Notificações não autorizadas pelo usuário.")
            }
        } catch {
            print("Erro ao solicitar permissão de notificações: \(error)")
        }
    }

    static func scheduleReminder(for emprestimo: Emprestimo) async {
        let content = UNMutableNotificationContent()
        content.title = "Hora de cobrar"
        content.body = "Cobrar \(emprestimo.pessoa) – R$ \(String(format: "%.2f", emprestimo.valor)) (\(emprestimo.descricao))"
        content.sound = .default

        let date = emprestimo.dataCobranca
        let comps = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: false)

        let request = UNNotificationRequest(identifier: emprestimo.id.uuidString, content: content, trigger: trigger)
        do {
            try await UNUserNotificationCenter.current().add(request)
        } catch {
            print("Falha ao agendar notificação: \(error)")
        }
    }

    static func cancelReminder(id: UUID) async {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id.uuidString])
    }
}
