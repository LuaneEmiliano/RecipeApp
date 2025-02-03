//
//  SearchBar.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

struct SearchBar: View {
    @ObservedObject var viewModel: RecipeAppViewModel
    @Binding var textField: String
    @State var showSheet = false
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "magnifyingglass")
            TextField("Search here...", text: $textField)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.black)
            })
        }
        .sheet(isPresented: $showSheet, content: {
            OptionCuisineListView(viewModel: viewModel)
        })
        .frame(height: 40)
        .padding(.leading, 20)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal, 5)
    }
}

#Preview {
    SearchBar(viewModel: RecipeAppViewModel(service: MockRecipeService()), textField: .constant(""))
}
