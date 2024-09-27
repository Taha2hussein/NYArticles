//
//  NYArticlesTests.swift
//  NYArticlesTests
//
//  Created by Taha Hussein on 26/09/2024.
//


import XCTest
@testable import NYArticles

class ArticleListViewTests: XCTestCase {
    
    var viewModel: NYArticleViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = NYArticleViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testLoadingState() {
        // Initially, articles should be nil, simulating loading state
        XCTAssertNil(viewModel.articles, "ViewModel should be in loading state with nil articles")
        
        // You can also add a loading state property if needed
        // XCTAssertTrue(viewModel.isLoading, "ViewModel should be loading")
    }
    
    func testArticleListPopulation() {
        // Mock articles data
        let mockArticles = ArticlesResponse(results: [
            Article(id: 1, uri: "", url: "", source: "", publishedDate: "", updated: "", section: "", subsection: "", nytdSection: "", adxKeywords: "", type: "", title: "Test Article", abstract: "", desFacet: [], orgFacet: [], perFacet: [], geoFacet: [], media: [], etaId: 0)
        ])
        
        // Inject mock articles into the ViewModel
        viewModel.articles = mockArticles
        
        // Assert that articles are populated correctly
        XCTAssertEqual(viewModel.articles?.results.first?.title, "Test Article", "The article title should be 'Test Article'")
    }
}
