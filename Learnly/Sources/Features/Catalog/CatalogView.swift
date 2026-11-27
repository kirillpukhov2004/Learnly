//
//  CatalogView.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import SwiftUI

struct CatalogView: View {
    var body: some View {
        ContentUnavailableView(AppTab.catalog.title, systemImage: AppTab.catalog.systemImage)
    }
}
