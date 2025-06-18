//
//  ArticleRepository.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation

import Foundation

protocol ArticleRepository {
    func fetchPopularArticles(completion: @escaping (Result<[Article], Error>) -> Void)
}
