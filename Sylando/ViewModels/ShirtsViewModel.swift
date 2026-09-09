
//  ShirtsViewModel.swift
//  Sylando
//
//  Created by Mykyta on 07.09.26.
//

import Foundation
import Observation
import SwiftUI

@Observable
class ShirtsViewModel {
    
    private let quoteRepository = QuoteRepository()
    var quote: Quote?
    
    var shirts: [Shirt] = [Shirt(title: "Classic White Tee", price: 19.99, size: "M"),
                                   Shirt(title: "Black V-Neck", price: 21.99, size: "L"),
                                   Shirt(title: "Graphic Print Tee", price: 24.99, size: "S")]
    
    func addNewShirt(shirt: Shirt) {
        shirts.append(shirt)
    }
    
    @MainActor
    func fetchQuote() {
       Task {
           do {
              quote = try await quoteRepository.getQuoteFromAPI()
           } catch  let error as HTTPError {
               print(error.message)
           } catch {
               print(error)
           }
        }
    }
    
}
