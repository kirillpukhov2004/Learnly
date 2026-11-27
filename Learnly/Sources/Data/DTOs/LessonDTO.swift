//
//  LessonDTO.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Foundation
import Core

struct LessonDTO: Sendable {
    let id: String
    let courseID: String
    let title: String
    let position: Int
    let durationSeconds: Int
    let hlsURL: String?
}

extension LessonDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case courseID = "course_id"
        case title
        case position
        case durationSeconds = "duration_seconds"
        case hlsURL = "hls_url"
    }
}

extension LessonDTO {
    func toDomain() -> Lesson? {
        guard
            let id = UUID(uuidString: id),
            let courseID = UUID(uuidString: courseID)
        else {
            return nil
        }

        return Lesson(
            id: id,
            courseID: courseID,
            title: title,
            position: position,
            durationSeconds: durationSeconds,
            hlsURL: hlsURL.flatMap(URL.init(string:))
        )
    }
}
