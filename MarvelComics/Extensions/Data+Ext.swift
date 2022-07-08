//
//  Data+Ext.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

extension Data {
    
    var utf8String: String? {
        return string(as: .utf8)
    }
    
    func string(as encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
}
