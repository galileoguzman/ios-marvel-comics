//
//  ComicModel.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

struct ComicsResponse: Decodable {
    let code: Int
    let status: String
    
    let data: ComicsDataResponse?
}

struct ComicsDataResponse: Decodable {
    let results: [ComicModel]?
}

struct ComicModel: Decodable {
    let id: Int
    let title: String?
    let thumbnail: ComicThumbnail?
}

struct ComicThumbnail: Decodable {
    let path: String
    let `extension`: String
}
