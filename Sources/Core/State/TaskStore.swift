import Foundation
import Observation

@Observable
final class TaskStore {
    var tasks: [TaskItem]
    var searchText = ""
    var selectedFilter: TaskFilter = .all

    init(tasks: [TaskItem] = TaskItem.sampleData) {
        self.tasks = tasks
    }

    var filteredTasks: [TaskItem] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return tasks.filter { item in
            let matchesFilter: Bool
            switch selectedFilter {
            case .all:
                matchesFilter = true
            case .open:
                matchesFilter = !item.isCompleted
            case .completed:
                matchesFilter = item.isCompleted
            }

            guard matchesFilter else { return false }
            guard !query.isEmpty else { return true }

            return item.title.lowercased().contains(query) || item.notes.lowercased().contains(query)
        }
    }

    var completedCount: Int {
        tasks.filter(\.isCompleted).count
    }

    var completionRatio: Double {
        guard !tasks.isEmpty else { return 0 }
        return Double(completedCount) / Double(tasks.count)
    }

    func addTask(title: String, notes: String) {
        let cleanedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !cleanedTitle.isEmpty else { return }

        let cleanedNotes = notes.trimmingCharacters(in: .whitespacesAndNewlines)
        tasks.insert(TaskItem(title: cleanedTitle, notes: cleanedNotes), at: 0)
    }

    func toggleCompletion(for id: TaskItem.ID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isCompleted.toggle()
        tasks[index].updatedAt = .now
    }

    func delete(offsets: IndexSet, visibleItems: [TaskItem]) {
        let idsToDelete = Set(offsets.map { visibleItems[$0].id })
        tasks.removeAll { idsToDelete.contains($0.id) }
    }
}

