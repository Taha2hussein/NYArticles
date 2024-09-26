//
//  moyaProvider.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
import Moya


let moyaProvider = NetworkClient(transport: MoyaProvider<MoyaAPI>(plugins: [NetworkLoggerPlugin()]))
