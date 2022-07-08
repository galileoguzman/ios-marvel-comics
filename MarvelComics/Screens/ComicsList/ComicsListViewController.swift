//
//  ViewController.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 06/07/22.
//

import UIKit

class ComicsListViewController: UIViewController, Storyboardable {
    var viewModel: ComicsListViewModel?
    
    var didSelectComic: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ComicsListViewController")
        
        let service = ComicsService()
        service.getComics { result in
            switch result {
            case .success(let comics):
                print("Result in VC \(comics)")
            case .failure(let error):
                print("Error in VC \(error.rawValue)")
            }
        }
    }


}

