//
//  ComicsListViewModel.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

final class ComicsListViewModel {

    
    // MARK: -
    
    var comicsDidChange: (() -> Void)?
    
    // MARK: - Initialization

    init() {
        
    }

    // MARK: - Public API
    
    var numberOfComics: Int {
        return 0
    }

    
    
}
