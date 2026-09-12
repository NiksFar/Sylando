//
//  CartViewModel.swift
//  Sylando
//
//  Created by Mykyta on 08.09.26.
//

import Foundation
import Observation
import SwiftUI

@Observable
class CartViewModel {
    
    var shirtsToBuy: [Shirt] = [Shirt(title: "Classic White Tee", price: 19.99, size: "M"),
                                Shirt(title: "Black V-Neck", price: 21.99, size: "L"),
                                Shirt(title: "Graphic Print Tee", price: 24.99, size: "S")]
    
    var subtotal: Double {
        shirtsToBuy.reduce(0) { $0 + $1.price }
    }
    
    func clearCart() {
        shirtsToBuy.removeAll()
    }
    
    func addToCart(shirt: Shirt) {
        shirtsToBuy.append(shirt)
    }
    
    func deleteFromCart(shirt: Shirt) {
        guard let index = shirtsToBuy.firstIndex(where: { $0.id == shirt.id }) else { return }
        shirtsToBuy.remove(at: index)
    }
    
}

