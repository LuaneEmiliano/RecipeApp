//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

class RecipeService: Network, RecipeServiceProtocol {
    func fetchRecipesDetails() async throws -> [Recipe] {
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            throw NetworkError.invalidURL
        }
        print(url.absoluteString)
        let container: RecipeAppModel = try await fetchRecipes(url: url)
        return container.recipes
    }
}
