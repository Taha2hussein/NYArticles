//
//  NYArticlesApp.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import SwiftUI

@main
struct NYArticlesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
