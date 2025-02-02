//
//  RecipeAppModel.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//
import Foundation

struct RecipeAppModel: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let id: String
    let cuisine: String?
    let name: String?
    let photoURLLarge: URL?
    let photoURLSmall: URL?
    let sourceURL: URL?
    let youtubeURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
}

extension Recipe {
    static var mockRecipeAPP = Recipe(
        id: "",
        cuisine: "Malaysian",
        name: "Apam Balik",
        photoURLLarge: URL(filePath: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg"),
        photoURLSmall: URL(filePath: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"),
        sourceURL: URL(filePath: "0c6ca6e7-e32a-4053-b824-1dbf749910d8"),
        youtubeURL: URL(filePath: "https://www.youtube.com/watch?v=6R8ffRRJcrg")
    )
}
