//
//  AppDependencies.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation

class AppDependencies:  HasNYArticleRepository{
    var nYArticleRepository: NYArticlRepository

    init(nYArticleRepository: NYArticlRepository) {
        self.nYArticleRepository = nYArticleRepository

    }
}

extension AppDependencies {
    static var shared: AppDependencies {
        AppDependencies(
            nYArticleRepository: NYArticleAPI()

        )
    }
}

// we make dependencies `var` when we are in debug mode, since changing dependencies should only be used for testing purposes only
#if DEBUG
var dependencies: AppDependencies = .shared
#else
let dependencies: AppDependencies = .shared
#endif
