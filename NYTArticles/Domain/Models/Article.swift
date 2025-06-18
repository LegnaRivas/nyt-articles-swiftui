//
//  Article.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation

struct Article: Identifiable, Codable {
    let id: Int
    let title: String
    let byline: String
    let publishedDate: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case byline
        case publishedDate = "published_date"
        case url
    }
}
