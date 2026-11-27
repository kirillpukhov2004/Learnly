import SwiftUI

@main
struct LearnlyApp: App {
    @State private var router = AppRouter()

    private let container: AppContainer = AppContainer()

    var body: some Scene {
        WindowGroup {
            RootTabView(router: router, container: container)
        }
    }
}
