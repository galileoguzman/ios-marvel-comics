//
//  URLSession+Ext.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

extension URLSession {

    func perform<T: Decodable>(_ request: URLRequest, decode decodable: T.Type, result: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // TODO: --
            // handle error scenarios... `result(.failure(error))`
            // handle bad response... `result(.failure(responseError))`
            // handle no data... `result(.failure(dataError))`

            do {
                let object = try JSONDecoder().decode(decodable, from: data!)
                result(.success(object))
            } catch {
                result(.failure(.invalidData))
            }

        }.resume()

    }

}
