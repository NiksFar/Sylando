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
    
    var shirtsToBuy: [Shirt] = []
    
    var subtotal: Double {
        shirtsToBuy.reduce(0) { $0 + $1.price }
    }
    
    func clearCart() {
        shirtsToBuy.removeAll()
    }
    
    func addToCart(shirt: Shirt) {
        shirtsToBuy.append(shirt)
    }
    
}

