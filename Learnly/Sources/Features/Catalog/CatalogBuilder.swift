//
//  CatalogBuilder.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation

@MainActor
enum CatalogBuilder {
    static func build(
        repository: any CourseRepository,
        appRouter: AppRouter
    ) -> CatalogView {
        let interactor = CatalogInteractor(repository: repository)
        let router = CatalogRouter(appRouter: appRouter)
        let presenter = CatalogPresenter(interactor: interactor, router: router)
        return CatalogView(presenter: presenter)
    }
}
