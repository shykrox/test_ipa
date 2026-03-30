import SwiftUI

struct TaskListView: View {
    @Bindable var store: TaskStore

    var body: some View {
        List {
            summarySection
            filterSection
            taskRowsSection
        }
        .listStyle(.insetGrouped)
        .searchable(text: $store.searchText, prompt: "Search title or notes")
        .animation(.snappy, value: store.filteredTasks)
    }

    private var summarySection: some View {
        Section {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(store.completedCount)/\(store.tasks.count) completed")
                    .font(.headline)

                ProgressView(value: store.completionRatio)
                    .progressViewStyle(.linear)
            }
            .padding(.vertical, 4)
        }
    }

    private var filterSection: some View {
        Section {
            Picker("Status", selection: $store.selectedFilter) {
                ForEach(TaskFilter.allCases) { filter in
                    Text(filter.label).tag(filter)
                }
            }
            .pickerStyle(.segmented)
        }
    }

    private var taskRowsSection: some View {
        Section("Items") {
            if store.filteredTasks.isEmpty {
                ContentUnavailableView.search
            } else {
                ForEach(store.filteredTasks) { item in
                    TaskRow(item: item) {
                        store.toggleCompletion(for: item.id)
                    }
                }
                .onDelete { offsets in
                    store.delete(offsets: offsets, visibleItems: store.filteredTasks)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        TaskListView(store: TaskStore())
    }
}

