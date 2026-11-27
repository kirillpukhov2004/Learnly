//
//  Course.swift
//  Core
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation

public struct Course: Identifiable, Hashable, Sendable {
    public let id: UUID
    public var title: String
    public var description: String
    public var coverURL: URL?
    public var category: Category?

    public init(id: UUID, title: String, description: String, coverURL: URL?, category: Category?) {
        self.id = id
        self.title = title
        self.description = description
        self.coverURL = coverURL
        self.category = category
    }
}

extension Course {
    public struct Category: RawRepresentable, Hashable, Sendable {
        public let rawValue: String

        public init?(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
