//
//  String+Extension.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation
import CryptoKit

extension String {
    func toMD5() -> String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
