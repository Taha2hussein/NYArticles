//
//  MockNYArticleRepository.swift
//  NYArticlesTests
//
//  Created by Taha Hussein on 27/09/2024.
//

import XCTest
@testable import NYArticles

class MockNYArticleRepository: NYArticlRepository {
    var fetchArticlesResult: Result<ArticlesResponse, APIError>?
    
    func fetchArticle(callback: @escaping (Result<ArticlesResponse, APIError>) -> ()) {
        if let result = fetchArticlesResult {
            callback(result)  // Ensure this is called
        }
    }
}
