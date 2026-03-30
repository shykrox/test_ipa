import SwiftUI

struct RootView: View {
    @Bindable var store: TaskStore
    @State private var isPresentingComposer = false

    var body: some View {
        NavigationStack {
            TaskListView(store: store)
                .navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isPresentingComposer = true
                        } label: {
                            Label("Add Task", systemImage: "plus")
                        }
                        .accessibilityIdentifier("addTaskButton")
                    }
                }
                .sheet(isPresented: $isPresentingComposer) {
                    TaskComposerView { title, notes in
                        store.addTask(title: title, notes: notes)
                    }
                }
        }
    }
}

#Preview {
    RootView(store: TaskStore())
}

