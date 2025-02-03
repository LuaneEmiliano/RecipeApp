//
//  RecipeAppView.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

struct RecipeAppView: View {
    @ObservedObject var viewModel: RecipeAppViewModel
    let cache = ImageCache() // Create a cache instance
    
    var body: some View {
        VStack {
            SearchBar(viewModel: viewModel, textField: $viewModel.searchText)
            List {
                ForEach(viewModel.filteredRecipes) { recipe in
                    RecipeListItemRow(
                        viewModel: RecipeCellViewModel(recipe: recipe),
                        cache: cache
                    )
                }
            }
            .task {
                viewModel.getRecipesDetails()
            }
        }
    }
}

#Preview {
    RecipeAppView(viewModel: RecipeAppViewModel(service: MockRecipeService()))
}
