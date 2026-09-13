//
//  LocalQuoteRepository.swift
//  Sylando
//
//  Created by Mykyta on 13.09.26.
//

import Foundation

@Observable
class LocalQuoteRepository: QuoteRepository {
    func getQuoteFromAPI() async throws -> Quote? {
        
        guard let url = Bundle.main.url(forResource: "quotes", withExtension: "json") else {
            throw HTTPError.invalidURL
        }
        
        let data = try Data(contentsOf: url)
        let result = try JSONDecoder().decode([Quote].self, from: data)

        return result.first
    }
    
}
