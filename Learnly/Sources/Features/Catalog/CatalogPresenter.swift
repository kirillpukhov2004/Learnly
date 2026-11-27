//
//  CatalogPresenter.swift
//  Learnly
//
//  Created by Kirill Pukhov on 27.11.2026.
//

import Observation
import Core

@Observable
@MainActor
final class CatalogPresenter {
    private let interactor: CatalogInteracting
    private let router: any CatalogRouting

    private(set) var state: State = .loading

    init(interactor: CatalogInteracting, router: CatalogRouter) {
        self.interactor = interactor
        self.router = router
    }

    func loadIfNeeded() async {
      guard case .loading = state else { return }
      
      await fetchCourses()
    }

    func reload() async {
        state = .loading
        await fetchCourses()
    }

    func refresh() async {
        await fetchCourses()
    }

    private func fetchCourses() async {
        do {
            let courses = try await interactor.loadCourses()
            state = courses.isEmpty ? .empty : .loaded(courses)
        } catch is CancellationError {
            return
        } catch {
            state = .error(error.localizedDescription)
        }
    }

    func didSelectCourse(with id: Course.ID) {
        router.openCourse(with: id)
    }
}

extension CatalogPresenter {
    enum State: Equatable {
        case loading
        case loaded([Course])
        case empty
        case error(String)
    }
}
