
import SwiftUI
import Combine
import UserNotifications

struct Theme {
    static let primary = Color(.primary)    // moss green
    static let secondary = Color(.secondary)  // lighter moss
    static let accent = Color(.accent)     // accent green
}

struct ContentView: View {
    @StateObject private var vm = EmprestimosViewModel()
    @State private var showingNew = false
    @State private var editing: Emprestimo? = nil

    var body: some View {
        NavigationStack {
            Group {
                if vm.emprestimos.isEmpty {
                    ContentUnavailableView(
                        "Sem empréstimos",
                        systemImage: "tray",
                        description: Text("Toque em + para adicionar um.")
                    )
                } else {
                    List {
                        ForEach(vm.emprestimos) { e in
                            EmprestimoRow(emprestimo: e)
                                .listRowBackground(Theme.secondary.opacity(0.50))
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button(role: .destructive) {
                                        if let index = vm.emprestimos.firstIndex(of: e) {
                                            vm.remove(at: IndexSet(integer: index))
                                        }
                                    } label: {
                                        Label("", systemImage: "trash")
                                    }

                                    Button {
                                        editing = e
                                    } label : {
                                        Label("", systemImage: "square.and.pencil")
                                    }
                                    
                                }
                        }
                        .onDelete(perform: vm.remove)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Empréstimos")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingNew = true
                    } label: {
                        Label("Novo", systemImage: "plus")
                    }
                }
            }
            .tint(Theme.accent)
            .sheet(isPresented: $showingNew) {
                NovoEmprestimoView { novo in
                    vm.add(novo)
                }
                .presentationDetents([.medium, .large])
            }
            .sheet(item: $editing) { item in
                NovoEmprestimoView(existing: item) { atualizado in
                    vm.update(atualizado)
                }
                .presentationDetents([.medium, .large])
            }
        }
    }
}

#Preview {
    ContentView()
}
