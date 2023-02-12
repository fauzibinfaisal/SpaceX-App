//
//  ImageLoader.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct ImageLoader {
    static func loadImage(from urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(ImageLoaderError.invalidURL))
            return
        }

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    completion(.success(image))
                } else {
                    completion(.failure(ImageLoaderError.invalidData))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
}

enum ImageLoaderError: Error {
    case invalidURL
    case invalidData
}
