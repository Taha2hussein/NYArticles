//
//  HomeAPIEndPoint.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
import Moya

enum HomeAPIEndPoint {
    case fetchTopHome
}

extension HomeAPIEndPoint: APIEndpoint {
    var baseURL: URL {
        return URL(string: EnviromentConfigurations.baseUrl.rawValue)!
    }

    var path: String {
        switch self {
        case .fetchTopHome:
            return "mostviewed/all-sections/7.json?api-key=\(EnviromentConfigurations.apiKey.rawValue)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .fetchTopHome:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchTopHome:
            return .requestPlain
        }
    }

    var headers: [String: String] {
        switch self {
        case .fetchTopHome:
            return HeadersRequest.shared.getHeaders(type: .normal)
        }
    }
}
