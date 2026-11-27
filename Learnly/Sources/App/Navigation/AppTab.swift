//
//  AppTab.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

enum AppTab: CaseIterable, Hashable {
    case catalog
    case shorts
    case profile

    var title: String {
        switch self {
        case .catalog: "Catalog"
        case .shorts: "Shorts"
        case .profile: "Profile"
        }
    }

    var systemImage: String {
        switch self {
        case .catalog: "books.vertical"
        case .shorts: "play.square.stack"
        case .profile: "person.crop.circle"
        }
    }
}
