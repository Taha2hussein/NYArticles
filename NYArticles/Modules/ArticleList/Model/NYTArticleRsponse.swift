//
//  NYTArticleModel.swift
//  NYArticles
//
//  Created by Taha Hussein on 26/09/2024.
//

import Foundation
import Foundation

// Generic API Response model
struct GenericAPIResponse<T: Codable>: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: T

    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
}

struct ArticlesResponse: Codable {
    let results: [Article]
}

struct Article: Codable, Identifiable {
    let id: Int
    let uri: String
    let url: String
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
    let media: [Media]
    let etaId: Int

    enum CodingKeys: String, CodingKey {
        case id
        case uri
        case url
        case source
        case publishedDate = "published_date"
        case updated
        case section
        case subsection
        case nytdSection = "nytdsection"
        case adxKeywords = "adx_keywords"
        case type
        case title
        case abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaId = "eta_id"
    }
}

struct Media: Codable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadata]

    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
