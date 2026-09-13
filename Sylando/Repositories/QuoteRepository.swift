//
//  QuoteRepository.swift
//  Sylando
//
//  Created by Mykyta on 13.09.26.
//

import Foundation

protocol QuoteRepository {
    
    func getQuoteFromAPI() async throws -> Quote?
    
}
