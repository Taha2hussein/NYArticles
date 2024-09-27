//
//  ArticleRow.swift
//  NYArticles
//
//  Created by Taha Hussein on 27/09/2024.
//

import SwiftUI
struct ArticleRow: View {
    let article: Article

    var body: some View {
        HStack {
            if let mediaURL = article.media.first?.mediaMetadata.first?.url {
                AsyncImage(url: URL(string: mediaURL)) { image in
                    image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }

            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                Text(article.abstract)
                    .font(.subheadline)
                    .lineLimit(2)
            }
            Spacer()
//            Image(systemName: "chevron.right")
        }
    }
}
