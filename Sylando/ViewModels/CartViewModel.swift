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
    
}

