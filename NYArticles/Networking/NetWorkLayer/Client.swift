//
//  Client.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
protocol Client {
    func performRequest<T: Decodable>(
        api: APIEndpoint,
        decodeTo: T.Type,
        completion: @escaping (Result<T, APIError>) -> Void
    )
    func performRequest(
        api: APIEndpoint,
        completion: @escaping (Result<Data, APIError>) -> Void
    )
}

protocol HasClient {
    var client: Client { get }
}
