//
//  HomeViewModel.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: NYTAPIService

    init(service: NYTAPIService = .shared) {
        self.service = service
        fetchArticles()
    }

    func fetchArticles() {
        isLoading = true
        errorMessage = nil

        service.fetchPopularArticles { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
