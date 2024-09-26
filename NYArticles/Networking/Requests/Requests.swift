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
    
    func fetchTopHome(callback: @escaping (Result<GenericAPIResponse<NYTArticleList>, APIError>) -> ()) {
        self.client.performRequest(api: HomeAPIEndPoint.fetchTopHome, decodeTo: GenericAPIResponse<NYTArticleList>.self) { (result) in
            switch result {
            case .success(let response):
                callback(.success(response))
            case .failure(let aPIError):
                callback(.failure(aPIError))
            }
        }
    }
}
