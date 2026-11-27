//
//  CourseView.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Core
import SwiftUI

struct CourseView: View {
    var courseID: Course.ID

    var body: some View {
        ContentUnavailableView(
            "Content Unavailable",
            systemImage: "xmark.octagon",
            description: Text("This screen will be implemented in the future.")
        )
    }
}
