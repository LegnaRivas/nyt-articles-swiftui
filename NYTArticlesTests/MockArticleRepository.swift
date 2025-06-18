//
//  MockArticleRepository.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation
@testable import NYTArticles

final class MockArticleRepository: ArticleRepository {
    let shouldFail: Bool

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func fetchPopularArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        if shouldFail {
            completion(.failure(NSError(domain: "Test", code: 1, userInfo: nil)))
        } else {
            let sample = Article(
                id: 1,
                title: "Sample Title",
                byline: "By Test Author",
                publishedDate: "2024-06-18",
                url: "https://example.com",
                abstract: "This is a test abstract."
            )
            completion(.success([sample]))
        }
    }
}
