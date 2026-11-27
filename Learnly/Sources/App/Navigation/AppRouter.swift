//
//  AppRouter.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Core
import Observation

enum CatalogRoute: Hashable {
    case courseDetail(Course.ID)
}

@MainActor
@Observable
final class AppRouter {
    var selectedTab: AppTab = .catalog
    var catalogPath: [CatalogRoute] = []
}
