//
//  Requests.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
struct NYArticleAPI: NYArticlRepository {
   
    let client: Client
    init(client: Client = moyaProvider) {
        self.client = client
    }
    
    func fetchArticle(callback: @escaping (Result<ArticlesResponse, APIError>) -> ()) {
  
        self.client.performRequest(api: HomeAPIEndPoint.fetchArticles, decodeTo: ArticlesResponse.self) { (result) in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let aPIError):
                callback(.failure(aPIError))
            }
        }
    }
}
