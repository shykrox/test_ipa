import SwiftUI

@main
struct CodexIOSStarterApp: App {
    @State private var store = TaskStore()

    var body: some Scene {
        WindowGroup {
            RootView(store: store)
        }
    }
}

