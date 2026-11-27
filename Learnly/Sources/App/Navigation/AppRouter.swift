//
//  AppRouter.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Observation

@MainActor
@Observable
final class AppRouter {
    var selectedTab: AppTab = .catalog
}
