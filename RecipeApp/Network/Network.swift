//
//  Network.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

internal class Network {
    enum NetworkError: Error {
        case invalidURL
        case failuredDecode
        case incorrectResponse
    }
    
    func fetchRecipes<T: Decodable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode < 200 || httpResponse.statusCode >= 300 {
            throw NetworkError.incorrectResponse
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}
