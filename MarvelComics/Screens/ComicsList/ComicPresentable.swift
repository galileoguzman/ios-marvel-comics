//
//  ComicPresentable.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 12/07/22.
//

import UIKit

protocol ComicPresentable {
    
    // MARK: - Properties

    var title: String  { get }
    var thumbnailUrl: URL { get }

}
