//
//  Repository.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation

protocol NYArticlRepository {
    func fetchArticle(callback: @escaping (Result<ArticlesResponse, APIError>) -> ())
}

protocol HasNYArticleRepository {
    var nYArticleRepository: NYArticlRepository { get }
}
