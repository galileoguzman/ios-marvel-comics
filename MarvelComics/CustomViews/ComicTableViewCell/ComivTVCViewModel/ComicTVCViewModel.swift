//
//  ComicTVCViewModel.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 12/07/22.
//


import UIKit

struct ComicTableViewCellViewModel {
    
    // MARK: - Properties
    
    let comic: ComicModel

}

extension ComicTableViewCellViewModel: ComicPresentable {
    
    // MARK: - Properties
    
    var id: String {
        return "\(comic.id)"
    }
    
    var title: String {
        return comic.title!
    }

    var thumbnailUrl : URL {
        var stringUrl = "\(comic.thumbnail!.path).\(comic.thumbnail!.extension)"
        stringUrl = stringUrl.replacingOccurrences(of: "http", with: "https")
        return URL(string: stringUrl)!
    }
    
}
