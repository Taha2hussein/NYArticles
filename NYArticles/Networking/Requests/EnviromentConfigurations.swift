//
//  EnviromentConfigurations.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
enum EnviromentConfigurations: String {
    case baseUrl = "https://api.nytimes.com/svc/mostpopular/v2"
    case apiKey = "JtLKD6tVcfrGJczLLAwPsjGYfCCMQJhu"

    var value : String {
        get {
            return Bundle.main.infoDictionary![self.rawValue] as! String
        }
    }
}

