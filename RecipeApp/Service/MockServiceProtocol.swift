//
//  MockServiceProtocol.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

class MockServiceProtocol {
    func fetchRecipesDetails(forSearch: String) async throws -> RecipeAppModel {
        RecipeAppModel.mockRecipeAPP
    }
}
