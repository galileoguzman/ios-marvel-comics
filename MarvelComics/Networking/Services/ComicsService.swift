//
//  ComicsService.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

class ComicsService {
    
    // TODO: Check for different environments for the baseURL
    private let baseURL = URL(string: "https://gateway.marvel.com/v1/public/comics")!
    private let publicKey = Environment.publicKey
    private let privateKey = Environment.privateKey
    
    init() {}
    
    func getComics(_ completed: @escaping(Result<[ComicModel], NetworkError>) -> Void) {
        
        // TODO: Wrap hash generation into own module
        let timestamp = Int(Date().timeIntervalSince1970)
        let hash = "\(timestamp)\(privateKey)\(publicKey)".toMD5()
        let url = baseURL.appending("ts", value: "\(timestamp)")
            .appending("apikey", value: publicKey)
            .appending("hash", value: hash)
        let request = URLRequest(url: url)

        // Performing HTTP request
        URLSession.shared.perform(request, decode: ComicsResponse.self) { (result) in
            switch result {
            case .failure(let error):
                completed(.failure(error))
            case .success(let object):
                completed(.success(object.data?.results ?? []))
            }
        }
        
    }
    

}
