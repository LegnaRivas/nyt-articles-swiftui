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

    private let fetchArticlesUseCase: FetchPopularArticlesUseCase

    init(useCase: FetchPopularArticlesUseCase = FetchPopularArticlesUseCase(repository: ArticleRepositoryImpl())) {
        self.fetchArticlesUseCase = useCase
        fetchArticles()
    }

    func fetchArticles() {
        isLoading = true
        errorMessage = nil

        fetchArticlesUseCase.execute { [weak self] result in
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
