import SwiftUI

struct TaskComposerView: View {
    @Environment(\.dismiss) private var dismiss
    @FocusState private var isTitleFocused: Bool

    @State private var title = ""
    @State private var notes = ""

    let onSave: (String, String) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("What do you need to do?", text: $title)
                        .focused($isTitleFocused)
                }

                Section("Notes") {
                    TextField("Optional details", text: $notes, axis: .vertical)
                        .lineLimit(3...8)
                }
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        save()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .onAppear {
                isTitleFocused = true
            }
        }
    }

    private func save() {
        onSave(title, notes)
        dismiss()
    }
}

#Preview {
    TaskComposerView { _, _ in }
}

