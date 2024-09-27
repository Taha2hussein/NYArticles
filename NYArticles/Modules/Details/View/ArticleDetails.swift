//
//  ArticleDetails.swift
//  NYArticles
//
//  Created by Taha Hussein on 27/09/2024.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    let article: Article 

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(Localization.PublishedOn.rawValue + (article.publishedDate))
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(article.abstract)
                    .font(.body)

                if let media = article.media.first {
                    AsyncImage(url: URL(string: media.mediaMetadata.first?.url ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(Localization.ArticleDetails.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}
