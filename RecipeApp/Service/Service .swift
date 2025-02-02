//
//  Service .swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

class Service: Network, ServiceProtocol {
    func fetchRecipesDetails(forSearch: String) async throws -> RecipeAppModel {
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            throw NetworkError.invalidURL
        }
        print(url.absoluteString)
        return try await fetchRecipes(url: url)
    }
}
