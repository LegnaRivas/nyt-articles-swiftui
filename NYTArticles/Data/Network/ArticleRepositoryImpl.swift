//
//  ArticleRepositoryImpl.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation
final class ArticleRepositoryImpl: ArticleRepository {
    private let apiService: NYTAPIService

    init(apiService: NYTAPIService = .shared) {
        self.apiService = apiService
    }

    func fetchPopularArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        apiService.fetchPopularArticles(completion: completion)
    }
}
