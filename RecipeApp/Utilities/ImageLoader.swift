//
//  ImageLoader.swift
//  RecipeApp
//
//  Created by Luane Niejelski Emiliano on 2/2/25.
//

import Combine
import UIKit

class ImageLoader: ObservableObject {
    enum ImageLoaderError: Error, LocalizedError {
        case invalidURL
        case networkError(Error)
        case dataConversionError
        case unknownError
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "The URL is invalid."
            case .networkError(let error):
                return "Network error: \(error.localizedDescription)"
            case .dataConversionError:
                return "Failed to convert data into an image."
            case .unknownError:
                return "An unknown error occurred."
            }
        }
    }
    
    @Published var image: UIImage?
    private let url: URL
    private let cache: ImageCache
    private var cancellable: AnyCancellable?
    
    init(url: URL, cache: ImageCache) {
        self.url = url
        self.cache = cache
    }
    
    func load() {
        if let cachedImage = cache.getImage(for: url) {
            self.image = cachedImage
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data in
                guard let image = UIImage(data: data) else {
                    throw ImageLoaderError.dataConversionError
                }
                return image
            }
            .handleEvents(receiveOutput: { [weak self] image in
                guard let url = self?.url else { return }
                self?.cache.setImage(image, for: url)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print((error as? ImageLoaderError) ?? .unknownError)
                }
            }, receiveValue: { [weak self] image in
                self?.image = image
            })
    }
    
    deinit {
        cancellable?.cancel()
    }
}
