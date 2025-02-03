//
//  RecipeAppViewModel.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

@MainActor
class RecipeAppViewModel: ObservableObject {
    @Published var container = [Recipe]()
    @Published var searchText: String = ""
    @Published var selectedCuisine: CuisineTypes? = nil
    
    let service: RecipeServiceProtocol
    
    init(service: RecipeServiceProtocol) {
        self.service = service
    }
    
    var filteredRecipes: [Recipe] {
        container.filter { recipe in
            let matchesCuisine = selectedCuisine == nil || recipe.cuisine?.localizedCaseInsensitiveContains(selectedCuisine!.rawValue) == true
            let matchesSearch = searchText.isEmpty || recipe.name?.localizedCaseInsensitiveContains(searchText) == true
            return matchesCuisine && matchesSearch
        }
    }

    
    func getRecipesDetails() {
        Task {
            container = try await service.fetchRecipesDetails()
        }
    }
}
