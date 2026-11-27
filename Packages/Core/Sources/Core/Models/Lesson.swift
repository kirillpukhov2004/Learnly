//
//  Lesson.swift
//  Core
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation

public struct Lesson: Identifiable, Hashable, Sendable {
    public let id: UUID
    public let courseID: Course.ID
    public var title: String
    public var position: Int
    public var durationSeconds: Int
    public var hlsURL: URL?

    public init(id: UUID, courseID: Course.ID, title: String, position: Int, durationSeconds: Int, hlsURL: URL?) {
        self.id = id
        self.courseID = courseID
        self.title = title
        self.position = position
        self.durationSeconds = durationSeconds
        self.hlsURL = hlsURL
    }
}
