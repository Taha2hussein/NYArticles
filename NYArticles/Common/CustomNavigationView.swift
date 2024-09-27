//
//  CustomNavigationView.swift
//  NYArticles
//
//  Created by Taha Hussein on 27/09/2024.
//

import SwiftUI
struct CustomNavigationView<Content: View>: View {
    let content: Content
    var title: String
    var onSearch: () -> Void
    var onSettings: () -> Void

    init(title: String, onSearch: @escaping () -> Void, onSettings: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.title = title
        self.onSearch = onSearch
        self.onSettings = onSettings
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: title, onSearch: onSearch, onSettings: onSettings)
            content
                .navigationBarHidden(true)
                Spacer()
        }
    }
}


struct CustomNavigationBar: View {
    var title: String
    var onSearch: () -> Void
    var onSettings: () -> Void

    var body: some View {
        HStack {
            Spacer()

            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()
                .frame(width: 20)
            Button(action: onSearch) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
            }
            Button(action: onSettings) {
                Image(systemName: "gear")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.green)
    }
}

