//
//  NYArticleViewModel.swift
//  NYArticles
//
//  Created by Taha Hussein on 27/09/2024.
//
import SwiftUI

class NYArticleViewModel: ObservableObject {
    
    @Published var articles: ArticlesResponse?
    @Published var shouldNavigateToDetail = false
    
    private let dependencis: AppDependencies
    
    init(dependencis: AppDependencies = dependencies) {
        self.dependencis = dependencies
    }
    
    func fetchArticles() {
        dependencis.nYArticleRepository.fetchArticle { result in
            switch result {
            case .success(let response):
                self.articles = response
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func navigateToDetail(article: Article) {
        shouldNavigateToDetail = true
    }
}
