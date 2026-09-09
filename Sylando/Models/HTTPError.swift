//
//  HTTPError.swift
//  Sylando
//
//  Created by Mykyta on 09.09.26.
//

import Foundation

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL: "Die URL ist ungültig"
        case .fetchFailed: "Laden ist fehlgeschlagen"
        }
    }
}
