//
//  ImageManager.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 12/07/22.
//

import UIKit

/// Data Manager error types.
///
/// - noData:           No valid data was received.
/// - parsingFailure:   The data parsing failed.
/// - endpointFailure:  The endpoint failed.
/// - invalidInput:     The input was invalid.
/// - anyError:         Generic wrapped error.
enum DataError: Error {
    case noData
    case parsingFailure
    case endpointFailure
    case invalidInput
    case anyError(Any)
}

/// ImageDataManager
///
/// Class for fetching and caching remote images.
final class ImageManager: NSObject {
    
    // MARK: Shared
    
    /// Shared image cache instance.
    static var shared = ImageManager()
    
    private override init() {}
    
    // MARK: Internal
    
    /// The internal image cache management.
    private var imageCache = [String:UIImage]()
    
    /// The internal task cache management.
    private var taskCache = [String:URLSessionDataTask]()
}

// MARK: - DataManager
extension ImageManager {
    
    /// Fetches the image with the URL.
    ///
    /// - Parameters:
    ///   - URL:            The URL of the image.
    ///   - completion:     The completion handler.
    func fetchRequest(with input: URL, completion: @escaping (UIImage?, DataError?) -> ()) {
        let key = input.absoluteString
        
        // Check if we've already cached the image.
        if let cachedImage = imageCache[key] {
            completion(cachedImage, nil)
            return
        }
        
        // Fetch the image.
        let task = URLSession.shared.dataTask(with: input) { [unowned self] (data, response, error) in
            defer {
                self.taskCache[key] = nil
            }
            
            // Generic data error.
            if let dataError = error {
                completion(nil, DataError.anyError(dataError));
                return
            }
            
            // Empty data error.
            guard let data = data else {
                completion(nil, DataError.noData)
                return
            }
            
            // Image conversion error.
            guard let image = UIImage(data: data) else {
                completion(nil, DataError.parsingFailure)
                return
            }
            
            completion(image, nil)
            self.imageCache[key] = image
        }
        
        // Run and store the task.
        taskCache[key] = task
        task.resume()
    }
    
    /// Cancels the image request with the URL.
    ///
    /// - Parameter URL: The URL of the fetched image.
    func cancelRequest(with URL: URL) {
        let key = URL.absoluteString
        guard let task = taskCache[key] else { return }
        task.cancel()
        taskCache[key] = nil
    }
}

// MARK: - UIImageView Support
extension UIImageView {
    
    /// Asynchronously fetches and sets the image with the URL.
    ///
    /// - Parameter URL: The URL of the remote image.
    func setImage(with URL: URL) {
        ImageManager.shared.fetchRequest(with: URL) { [weak self] (image, error) in
            guard error == nil else { return }
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
    
    /// Cancels the image request with the image URL.
    ///
    /// - Parameter URL: The URL of the remote image.
    func cancelImage(for URL: URL) {
        ImageManager.shared.cancelRequest(with: URL)
    }
}
