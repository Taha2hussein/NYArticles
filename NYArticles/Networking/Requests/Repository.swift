//
//  Repository.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation

protocol NYArticlRepository {
    func fetchTopHome(callback: @escaping (Result<GenericAPIResponse<NYTArticleList>, APIError>) -> ())
}

protocol HasNYArticleRepository {
    var nYArticleRepository: NYArticlRepository { get }
}
