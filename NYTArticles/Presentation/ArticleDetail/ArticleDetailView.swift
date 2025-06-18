//
//  ArticleDetailView.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import SwiftUI

struct ArticleDetailView: View {
    @ObservedObject var viewModel: ArticleDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.article.title)
                    .font(.title)
                    .bold()

                Text(viewModel.article.byline)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(viewModel.article.publishedDate)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Divider()

                Text(viewModel.article.abstract)
                    .font(.body)
                    .foregroundColor(.primary)

                Divider()

                Link("Read full article", destination: URL(string: viewModel.article.url)!)
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

