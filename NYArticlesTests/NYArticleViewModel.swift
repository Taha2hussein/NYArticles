//
//  NYArticleViewModel.swift
//  NYArticlesTests
//
//  Created by Taha Hussein on 27/09/2024.
//

import XCTest
import Combine
@testable import NYArticles

class NYArticleViewModelTests: XCTestCase {
    
    var viewModel: NYArticleViewModel!
    var mockRepository: MockNYArticleRepository!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockNYArticleRepository()
        let dependencies = AppDependencies(nYArticleRepository: mockRepository)
        viewModel = NYArticleViewModel(dependencis: dependencies)
        cancellables = Set<AnyCancellable>()
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchArticlesSuccess() {
     
        // Create an expectation
        let expectation = XCTestExpectation(description: "fetchArticles completes")
        
        // Listen for changes on the articles property
        viewModel.$articles
            .sink { articles in
                if let articles = articles {
                    XCTAssertNotEqual(articles.results.first?.title, nil)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        // Perform fetch
        viewModel.fetchArticles()
        
        // Wait for the expectation with a longer timeout
        wait(for: [expectation], timeout: 5.0)
        

    }
    
    func testMock() {
        // Prepare mock data
        let mockArticles = ArticlesResponse(results: [
            Article(id: 1, uri: "", url: "", source: "", publishedDate: "", updated: "", section: "", subsection: "", nytdSection: "", adxKeywords: "", type: "", title: "Test Title", abstract: "", desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: [], etaId: 0)
        ])
        
        // Set the mock repository's result
        mockRepository.fetchArticlesResult = .success(mockArticles)
        
        mockRepository.fetchArticle { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data.results.first?.title, "Test Title")
            case .failure(let error):
                XCTAssertEqual(error,.notAuthorized)
            }
        }
        
    }

    func testFetchArticlesFailure() {
        // Prepare mock error
        mockRepository.fetchArticlesResult = .failure(APIError.forbiddenError)
        
        // Create an expectation
        let expectation = XCTestExpectation(description: "fetchArticles fails")
        
        // Perform fetch
        viewModel.fetchArticles()
        
        // Since fetchArticles() is asynchronous, wait until it finishes
        viewModel.$articles
            .sink { articles in
                XCTAssertNil(articles)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        // Wait for the expectation
        wait(for: [expectation], timeout: 5.0)
    }
}
