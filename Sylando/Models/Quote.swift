//
//  Quote.swift
//  Sylando
//
//  Created by Mykyta on 09.09.26.
//

import Foundation

struct Quote: Codable, Identifiable {
    var id: String
    var author: String
    var text: String
}
