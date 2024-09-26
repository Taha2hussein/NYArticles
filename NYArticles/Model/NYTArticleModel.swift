//
//  NYTArticleModel.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
struct NYTArticleList: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [Articles]
}

struct Articles: Codable {
    let uri: String
    let url: String
    let id: Int
    let assetId: Int
    let source: String
    let publishedDate: String
    let updated: String
    let section: String
    let subsection: String
    let nytdSection: String
    let adxKeywords: String
    let type: String
    let title: String
    let abstract: String
    let desFacet: [String]
    let orgFacet: [String]
    let perFacet: [String]
    let geoFacet: [String]
    let media: [Medias]
    let etaId: Int
}

struct Medias: Codable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadata]
}

struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
