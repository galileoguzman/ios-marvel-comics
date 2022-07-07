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
    }


}

