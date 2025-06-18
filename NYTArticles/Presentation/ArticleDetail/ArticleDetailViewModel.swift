//
//  ArticleDetailViewModel.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import Foundation

final class ArticleDetailViewModel: ObservableObject {
    let article: Article

    init(article: Article) {
        self.article = article
    }
}
