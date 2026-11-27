//
//  CourseRepository.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation
import Core

protocol CourseRepository: Sendable {
    func fetchCourses() async throws -> [Course]
    func fetchCourse(with id: Course.ID) async throws -> Course?
    func fetchLessons(for courseID: Course.ID) async throws -> [Lesson]
}
