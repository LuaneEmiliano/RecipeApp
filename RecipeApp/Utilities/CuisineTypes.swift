//
//  CuisineTypes.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Foundation

enum CuisineTypes: String, CaseIterable {
    case american = "American"
    case british = "British"
    case canadian = "Canadian"
    case croatian = "Croatian"
    case french = "French"
    case greek = "Greek"
    case italian = "Italian"
    case malaysian = "Malaysian"
    case polish = "Polish"
    case portuguese = "Portuguese"
    case russian = "Russian"
    case tunisian = "Tunisian"
   
    var name: String {
        self.rawValue
    }
}

