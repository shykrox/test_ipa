import Foundation

struct TaskItem: Identifiable, Hashable {
    let id: UUID
    var title: String
    var notes: String
    var isCompleted: Bool
    var createdAt: Date
    var updatedAt: Date

    init(
        id: UUID = UUID(),
        title: String,
        notes: String = "",
        isCompleted: Bool = false,
        createdAt: Date = .now,
        updatedAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.notes = notes
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

extension TaskItem {
    static let sampleData: [TaskItem] = [
        TaskItem(title: "Ship iOS starter", notes: "Scaffold + docs", isCompleted: true),
        TaskItem(title: "Run on simulator", notes: "iPhone 16 Pro"),
        TaskItem(title: "Profile scrolling", notes: "SwiftUI + Time Profiler")
    ]
}

