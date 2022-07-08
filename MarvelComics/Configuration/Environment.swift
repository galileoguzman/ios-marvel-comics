//
//  Environment.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation


enum Environment: String {
    
    // MARK: - Environments
    
    case development
    case staging
    case production

    // MARK: - Current Environment
    
    static let current: Environment = {
        // Read Value From Info.plist
        guard let value = Bundle.main.infoDictionary?["CONFIGURATION"] as? String else {
            fatalError("No Configuration Found")
        }
        
        // Extract Environment
        guard let rawValue = value.split(separator: "/").last else {
            fatalError("Invalid Environment")
        }
        
        // Create Environment
        guard let environment = Environment(rawValue: rawValue.lowercased()) else {
            fatalError("Invalid Environment")
        }
        
        return environment
    }()

    // MARK: - Secrets
    
    // TODO: Wrap file reading into a compute property
    static var publicKey: String {
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist") else {
              fatalError("Couldn't find file 'Secrets.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "PUBLIC_KEY") as? String else {
              fatalError("Couldn't find key 'PUBLIC_KEY' in 'Secrets.plist'.")
            }
            return value
    }
    
    static var privateKey: String {
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist") else {
              fatalError("Couldn't find file 'Secrets.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "PRIVATE_KEY") as? String else {
              fatalError("Couldn't find key 'PRIVATE_KEY' in 'Secrets.plist'.")
            }
            return value
    }
    
}
