//
//  RecipeAppView.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

struct RecipeAppView: View {
    @ObservedObject var viewModel: RecipeAppViewModel
    
    var body: some View {
        List(viewModel.items) { item in
        //    RecipeListItemRow(item: item)
        }
        .task {
            viewModel.getRecipesDetails()
        }
    }
}

#Preview {
    RecipeAppView(viewModel: RecipeAppViewModel(service: MockRecipeService()))
}
