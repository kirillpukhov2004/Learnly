import SwiftUI

@main
struct LearnlyApp: App {
    @State private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            RootTabView(router: router)
        }
    }
}
