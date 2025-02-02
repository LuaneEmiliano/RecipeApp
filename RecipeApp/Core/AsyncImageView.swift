//
//  AsyncImageView.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Image
    private let image: (Image) -> Image
    
    init(
        url: URL,
        cache: ImageCache,
        @ViewBuilder image: @escaping (Image) -> Image = { $0 },
        placeholder: Image = Image(systemName: "photo")
    ) {
        self.placeholder = placeholder
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: cache))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if let uiImage = loader.image {
                image(Image(uiImage: uiImage))
                    .resizable()
            } else {
                placeholder
                    .resizable()
            }
        }
    }
}
