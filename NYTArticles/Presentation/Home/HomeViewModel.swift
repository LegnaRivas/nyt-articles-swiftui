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
    private let cache = ArticleLocalCache() // 👈

    init(useCase: FetchPopularArticlesUseCase = FetchPopularArticlesUseCase(repository: ArticleRepositoryImpl())) {
        self.fetchArticlesUseCase = useCase
        if let cached = cache.load() {
            self.articles = cached
        }

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
                    self?.cache.save(articles)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
