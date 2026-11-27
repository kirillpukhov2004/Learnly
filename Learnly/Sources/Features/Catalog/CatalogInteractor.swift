//
//  CatalogInteractor.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation
import Core

protocol CatalogInteracting: Sendable {
    func loadCourses() async throws -> [Course]
}

final class CatalogInteractor: CatalogInteracting {
    private let repository: any CourseRepository

    init(repository: any CourseRepository) {
        self.repository = repository
    }

    func loadCourses() async throws -> [Course] {
        try await repository.fetchCourses()
    }
}
