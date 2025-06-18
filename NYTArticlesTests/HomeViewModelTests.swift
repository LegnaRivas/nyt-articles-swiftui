//
//  HomeViewModelTests.swift
//  NYTArticles
//
//  Created by Angel Rivas on 18/06/25.
//

import XCTest
@testable import NYTArticles

final class HomeViewModelTests: XCTestCase {

    func testFetchArticlesSuccess() {
        let mockRepo = MockArticleRepository(shouldFail: false)
        let useCase = FetchPopularArticlesUseCase(repository: mockRepo)
        let viewModel = HomeViewModel(useCase: useCase)

        let expectation = XCTestExpectation(description: "Articles loaded")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(viewModel.articles.count, 1)
            XCTAssertEqual(viewModel.articles.first?.title, "Sample Title")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
