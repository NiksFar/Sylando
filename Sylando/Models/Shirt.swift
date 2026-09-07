//
//  Shirt.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import Foundation

struct Shirt: Codable, Identifiable {
    
    let id: UUID = UUID()
    let title: String
    let price: Double
    let size: String
    
}
