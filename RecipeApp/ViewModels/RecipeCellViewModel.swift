//
//  RecipeCellViewModel.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

class RecipeCellViewModel: ObservableObject {
    let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var cuisine: String {
        return recipe.cuisine ?? ""
    }
    
    var name: String {
        return recipe.name ?? "--"
    }
    
    var photoURLSmall: URL? {
        return recipe.photoURLSmall
    }
    
    var sourceURL: URL? {
        return recipe.sourceURL
    }
    
    var youtubeURL: URL? {
        return recipe.youtubeURL
    }
}
