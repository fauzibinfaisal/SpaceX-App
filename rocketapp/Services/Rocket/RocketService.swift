//
//  RocketService.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import Foundation

protocol RocketServiceProtocol {
    func fetchRocketList(completion: @escaping (Result<[RocketResponse], Error>) -> Void)
}

class RocketService: RocketServiceProtocol {
    private let baseURL = "https://api.spacexdata.com/v4/rockets"

    func fetchRocketList(completion: @escaping (Result<[RocketResponse], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(ErrorType.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ErrorType.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let rockets = try decoder.decode([RocketResponse].self, from: data)
                completion(.success(rockets))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchRocket(id: String, completion: @escaping (Result<RocketResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(id)") else {
            completion(.failure(ErrorType.invalidURL))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(ErrorType.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let rockets = try decoder.decode(RocketResponse.self, from: data)
                completion(.success(rockets))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

    private enum ErrorType: Error {
        case invalidURL
        case noData
    }
}
