//
//  FetchPopularArticlesUseCase.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation
final class FetchPopularArticlesUseCase {
    private let repository: ArticleRepository

    init(repository: ArticleRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[Article], Error>) -> Void) {
        repository.fetchPopularArticles(completion: completion)
    }
}
