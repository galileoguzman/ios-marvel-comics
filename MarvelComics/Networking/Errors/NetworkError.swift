//
//  NetworkError.swift
//  MarvelComics
//
//  Created by Galileo Guzman on 07/07/22.
//

import Foundation

enum NetworkError: String, Error {
    case unableToComplete = "Unable to complete your request."
    case invalidToken = "Invalid token or has expired."
    case invalidResponse = "Invalid server response."
    case invalidData = "Invalid data."
    case serviceUnavailable = "It seems like our server is having some troubles at the moment, please try later."
}
