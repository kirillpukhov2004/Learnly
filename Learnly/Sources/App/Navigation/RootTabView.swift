//
//  RootTabView.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import SwiftUI

struct RootTabView: View {
    @Bindable var router: AppRouter

    let container: AppContainer

    var body: some View {
        TabView(selection: $router.selectedTab) {
            NavigationStack(path: $router.catalogPath) {
                CatalogBuilder.build(repository: container.courseRepository, appRouter: router)
                    .navigationDestination(for: CatalogRoute.self) { route in
                        switch route {
                        case .courseDetail(let courseID):
                            CourseView(courseID: courseID)
                        }
                    }
            }
            .tabItem {
                Label(AppTab.catalog.title, systemImage: AppTab.catalog.systemImage)
            }
            .tag(AppTab.catalog)

            NavigationStack {
                ShortsView()
            }
            .tabItem {
                Label(AppTab.shorts.title, systemImage: AppTab.shorts.systemImage)
            }
            .tag(AppTab.shorts)

            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label(AppTab.profile.title, systemImage: AppTab.profile.systemImage)
            }
            .tag(AppTab.profile)
        }
    }
}
