//
//  ComicTableViewCell.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 12/07/22.
//

import UIKit

class ComicTableViewCell: UITableViewCell {
    
    // MARK: Cell identifier
    static let identifier = "ComicTableViewCell"
    static let height: CGFloat = 180.0

    @IBOutlet private var lblComicTitle: UILabel!
    
    @IBOutlet weak var imgComicThumbnail: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    private func setupView() {
        // TODO: Define custom design
    }
    
    func configure(with presentable: ComicPresentable) {
        lblComicTitle.text = presentable.title
        processThumbnailDownload(with: presentable.thumbnailUrl)
    }
    
    private func processThumbnailDownload(with url: URL) {
        imgComicThumbnail.setImage(with: url)
    }
}
