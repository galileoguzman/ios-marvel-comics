//
//  ComicsListViewModel.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

final class ComicsListViewModel {

    
    // MARK: -
    private let service: ComicsService
    
    var comicsDidChange: (() -> Void)?
    
    private var comics: [ComicModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.comicsDidChange?()
            }
        }
    }
    
    
    // MARK: - Initialization

    init(service: ComicsService) {
        self.service = service
        
        fetchComics()
    }

    // MARK: - Public API
    
    var numberOfComics: Int {
        return comics.count
    }
    
    func presentable(for index: Int) -> ComicPresentable {
        return ComicTableViewCellViewModel(comic: comic(at: index))
    }
    
    func reloadBarmans() {
        fetchComics()
    }
    
    // MARK: Private API
    
    private func fetchComics() {
        service.getComics { result in
            switch result {
            case .success(let comics):
                self.comics = comics
            case .failure(let error):
                print("Something wrong happened!!! \(error.rawValue)")
            }
        }
    }

    private func comic(at index: Int) -> ComicModel {
        return comics[index]
    }

    
    
}
