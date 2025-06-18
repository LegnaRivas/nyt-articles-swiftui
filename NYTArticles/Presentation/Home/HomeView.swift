//
//  HomeView.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading articles...")
                } else if viewModel.articles.isEmpty {
                    Text("No articles available.")
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(viewModel: ArticleDetailViewModel(article: article))) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text(article.title).font(.headline)
                                Text(article.byline).font(.subheadline).foregroundColor(.gray)
                                Text(article.publishedDate).font(.caption).foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("NYT Articles")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "An unknown error occurred"),
                    dismissButton: .default(Text("OK")) {
                        viewModel.errorMessage = nil
                    }
                )
            }
            .onReceive(viewModel.$errorMessage) { error in
                showAlert = error != nil
            }
        }
    }
}

