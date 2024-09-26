//
//  Transport.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
protocol Transport {
    func send(endPoint: APIEndpoint, completion: @escaping (Result<(data: Data, response: HTTPURLResponse), Error>) -> ())
}
