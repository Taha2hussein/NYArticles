//
//  APIEndpoint.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
import Moya

protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task{ get }
    var headers: [String : String] { get }
}

extension APIEndpoint {
    var path: String {
        return ""
    }
}

enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum Task {
    /// A request with no additional data.
    case requestPlain

    /// A request body set with data.
    case requestData(Data)
    
    /// A request body set with `Encodable` type.
    case requestJSONEncodable(Encodable)
    
    /// A request with URL parameters.
    case requestParameters(parameters: [String: Any], encoding: URLEncoding)
    
    /// Upload multipart data.
    case uploadMultipart([MultipartFormData])
    
    /// Upload composite multipart data with URL parameters.
    case uploadCompositeMultipart([MultipartFormData], urlParameters: [String: Any])

    /// A request with both URL parameters and a body.
    case requestCompositeData(bodyData: Data, urlParameters: [String: Any])
}
