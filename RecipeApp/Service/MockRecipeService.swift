//
//  MockRecipeService.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

class MockRecipeService: RecipeServiceProtocol {
    func fetchRecipesDetails() async throws -> [Recipe] {
        [Recipe.mockRecipeAPP]
    }
}
