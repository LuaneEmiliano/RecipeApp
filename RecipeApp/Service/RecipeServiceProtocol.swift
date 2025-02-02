//
//  RecipeServiceProtocol.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

protocol RecipeServiceProtocol {
    func fetchRecipesDetails() async throws -> [Recipe]
}
