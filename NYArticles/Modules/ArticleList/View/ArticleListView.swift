//
//  ArticleListView.swift
//  NYArticles
//
//  Created by Taha Hussein on 27/09/2024.
//

import SwiftUI


struct ArticleListView: View {
    @StateObject var viewModel: NYArticleViewModel = NYArticleViewModel()

    var body: some View {
        NavigationView {
            CustomNavigationView(
                title: Localization.navigationTitle.rawValue,
                onSearch: { print("Search tapped") },
                onSettings: { print("Settings tapped") }
            ) {
                if let articles = viewModel.articles?.results {
                    List(articles, id: \.id) { article in
                        
                        // we can do navigation and pass data using coordinator
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleRow(article: article)
                                .contentShape(Rectangle())
                        }
                    }
                } else {
                    Text("Loading articles...").padding()
                }
            }
            .task {
                viewModel.fetchArticles()
            }
        }
    }
}
