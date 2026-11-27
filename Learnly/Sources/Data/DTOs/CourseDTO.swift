//
//  CourseDTO.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation
import Core

struct CourseDTO: Sendable {
    let id: String
    let title: String
    let description: String
    let coverURL: String?
    let category: String?
}

extension CourseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case coverURL = "cover_url"
        case category
    }
}

extension CourseDTO {
    func toDomain() -> Course? {
        guard let id = UUID(uuidString: id) else {
            return nil
        }

        return Course(
            id: id,
            title: title,
            description: description,
            coverURL: coverURL.flatMap(URL.init(string:)),
            category: category.flatMap(Course.Category.init(rawValue:))
        )
    }
}
