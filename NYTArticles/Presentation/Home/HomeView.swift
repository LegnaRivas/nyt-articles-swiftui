//
//  HomeView.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading articles...")
                } else if let error = viewModel.errorMessage {
                    VStack(spacing: 8) {
                        Text("Error: \(error)")
                            .foregroundColor(.red)
                        Button("Retry") {
                            viewModel.fetchArticles()
                        }
                    }
                } else {
                    List(viewModel.articles) { article in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.byline)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(article.publishedDate)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("NYT Articles")
        }
    }
}

