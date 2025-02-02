//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

@main
struct RecipeAppApp: App {
    @StateObject var viewModel = RecipeAppViewModel(service: RecipeService())
    
    var body: some Scene {
        WindowGroup {
            RecipeAppView(viewModel:viewModel)
        }
    }
}
