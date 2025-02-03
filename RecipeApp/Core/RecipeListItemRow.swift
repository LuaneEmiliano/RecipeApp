//
//  RecipeCellView.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

struct RecipeListItemRow: View {
    @ObservedObject var viewModel: RecipeCellViewModel
    var cache: ImageCache
    
    var body: some View {
        HStack(alignment: .bottom) {
            if let url = viewModel.recipe.photoURLSmall {
                AsyncImageView(url: url, cache: cache)
                    .frame(width: 90, height: 90)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(3.0)
            } else {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text(viewModel.cuisine)
                    .font(.callout)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                Text(viewModel.name)
                    .font(.footnote)
                    .padding(.bottom, 10)
                Text(viewModel.youtubeURL?.absoluteString ?? "")
                    .font(.footnote)
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    RecipeListItemRow(viewModel: RecipeCellViewModel(recipe: Recipe.mockRecipeAPP), cache:  ImageCache())
}
