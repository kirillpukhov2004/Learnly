//
//  ProfileView.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ContentUnavailableView(AppTab.profile.title, systemImage: AppTab.profile.systemImage)
    }
}
