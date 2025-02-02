//
//  ServiceProtocol.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

protocol ServiceProtocol {
    func fetchRecipesDetails(forSearch: String) async throws -> RecipeAppModel
}
