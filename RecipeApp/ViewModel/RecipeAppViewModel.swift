//
//  RecipeAppViewModel.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

@MainActor
class RecipeAppViewModel: ObservableObject {
    @Published var recipes: [RecipeAppModel] = []
}
