//
//  OptionCuisineListView.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

struct OptionCuisineListView: View {
    @ObservedObject var viewModel: RecipeAppViewModel
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: RecipeAppViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(CuisineTypes.allCases, id: \.self) { type in
            Button {
                viewModel.getRecipesDetails()
                dismiss()
            } label: {
                HStack {
                    Text(type.name)
                    Spacer()
                }
                .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    OptionCuisineListView(viewModel: RecipeAppViewModel(service: MockRecipeService()))
}
