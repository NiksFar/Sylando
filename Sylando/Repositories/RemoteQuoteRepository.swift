//
//  RemoteQuoteRepository.swift
//  Sylando
//
//  Created by Mykyta on 09.09.26.
//

import Foundation

@Observable
class RemoteQuoteRepository: QuoteRepository {
    
    let urlString = "https://api.syntax-institut.de/quotes?language=DE"
    
    func getQuoteFromAPI() async throws -> Quote? {
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode([Quote].self, from: data)

        return result.first
    }
}
