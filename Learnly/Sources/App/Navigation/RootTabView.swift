//
//  RootTabView.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import SwiftUI

struct RootTabView: View {
    @Bindable var router: AppRouter

    var body: some View {
        TabView(selection: $router.selectedTab) {
            NavigationStack {
                CatalogView()
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
