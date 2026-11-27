//
//  CatalogView.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import SwiftUI

struct CatalogView: View {
    @State var presenter: CatalogPresenter

    var body: some View {
        Group {
            switch presenter.state {
            case .loading:
                ProgressView("Loading courses...")

            case .empty:
                ContentUnavailableView(
                    "No Courses",
                    systemImage: "books.vertical",
                    description: Text("There are no courses available right now.")
                )

            case .error(let message):
                ContentUnavailableView {
                    Label("Something Went Wrong", systemImage: "exclamationmark.triangle")
                } description: {
                    Text(message)
                } actions: {
                    Button("Reload") {
                        Task { await presenter.reload() }
                    }
                    .buttonStyle(.borderedProminent)
                }

            case .loaded(let courses):
                List(courses) { course in
                    Button {
                        presenter.didSelectCourse(with: course.id)
                    } label: {
                        Text(course.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .tint(.primary)
                }
                .refreshable {
                    await presenter.refresh()
                }
            }
        }
        .navigationTitle("Catalog")
        .task { await presenter.reload() }
    }
}
