//
//  MockCourseRepository.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation
import Core

enum MockCourseRepositoryError: Error {
    case catalogNotFound
}

actor MockCourseRepository: CourseRepository {
    private let bundle: Bundle
    private let resourceName: String
    private let simulatedDelay: Duration

    private var cachedCatalog: CatalogDTO?

    init(bundle: Bundle = .main, resourceName: String = "mock_catalog", simulatedDelay: Duration = .milliseconds(750)) {
        self.bundle = bundle
        self.resourceName = resourceName
        self.simulatedDelay = simulatedDelay
    }

    func fetchCourses() async throws -> [Course] {
        try await Task.sleep(for: simulatedDelay)

        return try fetchCatalog().courses.compactMap { $0.toDomain() }
    }

    func fetchCourse(with id: Course.ID) async throws -> Course? {
        try await Task.sleep(for: simulatedDelay)

        return try fetchCatalog().courses.compactMap { $0.toDomain() }.first { $0.id == id }
    }

    func fetchLessons(for courseID: Course.ID) async throws -> [Lesson] {
        try await Task.sleep(for: simulatedDelay)

        return try fetchCatalog().lessons.compactMap { $0.toDomain() }.filter { $0.courseID == courseID }
    }

    private func fetchCatalog() throws -> CatalogDTO {
        if let cachedCatalog {
            return cachedCatalog
        }

        guard let catalogURL = bundle.url(forResource: resourceName, withExtension: "json") else {
            throw MockCourseRepositoryError.catalogNotFound
        }

        let catalogData = try Data(contentsOf: catalogURL)
        let catalog = try JSONDecoder().decode(CatalogDTO.self, from: catalogData)
        cachedCatalog = catalog
        return catalog
    }
}

extension MockCourseRepository {
    private struct CatalogDTO: Decodable {
        let courses: [CourseDTO]
        let lessons: [LessonDTO]
    }
}
