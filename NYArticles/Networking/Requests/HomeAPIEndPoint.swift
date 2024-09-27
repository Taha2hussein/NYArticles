//
//  HomeAPIEndPoint.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
import Moya

enum HomeAPIEndPoint {
    case fetchArticles
}

extension HomeAPIEndPoint: APIEndpoint {
    var baseURL: URL {
        return URL(string: EnviromentConfigurations.baseUrl.rawValue)!
    }

    var path: String {
        switch self {
        case .fetchArticles:
            return "mostviewed/all-sections/7.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchArticles:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchArticles:
            let parameter = ["api-key":EnviromentConfigurations.apiKey.rawValue]
            return .requestParameters(parameters: parameter, encoding: .default)
        }
    }

    var headers: [String: String] {
        switch self {
        case .fetchArticles:
            return HeadersRequest.shared.getHeaders(type: .normal)
        }
    }
}
