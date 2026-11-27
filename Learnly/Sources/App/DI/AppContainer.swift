//
//  AppContainer.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation

@MainActor
final class AppContainer {
    let courseRepository: CourseRepository

    init(courseRepository: CourseRepository = MockCourseRepository()) {
        self.courseRepository = courseRepository
    }
}
