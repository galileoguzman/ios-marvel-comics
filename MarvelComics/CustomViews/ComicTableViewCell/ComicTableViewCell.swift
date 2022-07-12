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
    
    let cache = NSCache<NSString, UIImage>()

    @IBOutlet private var lblComicTitle: UILabel!
    
    @IBOutlet private var imgComicThumbnail: UIImageView!
    
    
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
        let cacheKey = NSString(string: url.absoluteString)
        if let image = cache.object(forKey: cacheKey) {
            self.imgComicThumbnail.image = image
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.imgComicThumbnail.image = image
            }
        }
        
        task.resume()
    }
}
