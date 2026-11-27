//
//  CatalogRouter.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Core

@MainActor
protocol CatalogRouting: AnyObject {
    func openCourse(with id: Course.ID)
}

final class CatalogRouter: CatalogRouting {
    private let appRouter: AppRouter

    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    func openCourse(with id: Course.ID) {
        appRouter.catalogPath.append(.courseDetail(id))
    }
}
