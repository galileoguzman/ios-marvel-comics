//
//  ComicDetailViewController.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 12/07/22.
//

import UIKit

class ComicDetailViewController: UIViewController, Storyboardable {

    @IBOutlet weak var lblComicTitle: UILabel!
    @IBOutlet weak var imgComicCover: UIImageView!
    
    // MARK: -
    var presentable: ComicPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initController()
    }
    
    private func initController() {
        lblComicTitle.text = presentable?.title
        imgComicCover.setImage(with: presentable!.thumbnailUrl)
    }

}
