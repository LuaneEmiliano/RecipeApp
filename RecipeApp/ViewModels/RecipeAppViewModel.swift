//
//  RecipeAppViewModel.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

@MainActor
class RecipeAppViewModel: ObservableObject {
    @Published var items = [Recipe]()
    let service: RecipeServiceProtocol
    
    init(service: RecipeServiceProtocol) {
        self.service = service
    }
    
    func getRecipesDetails() {
        Task {
            items = try await service.fetchRecipesDetails()
        }
    }
}
