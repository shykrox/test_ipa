enum TaskFilter: String, CaseIterable, Identifiable {
    case all
    case open
    case completed

    var id: String { rawValue }

    var label: String {
        switch self {
        case .all:
            return "All"
        case .open:
            return "Open"
        case .completed:
            return "Completed"
        }
    }
}

