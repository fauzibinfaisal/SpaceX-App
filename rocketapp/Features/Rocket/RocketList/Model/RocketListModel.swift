//
//  RocketListModel.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

struct RocketModel {
    let id: String
    let name: String
    let description: String
    let image: String
    
    init(rocket: RocketResponse) {
        self.id = rocket.id
        self.name = rocket.name
        self.description = rocket.description
        self.image = rocket.flickrImages.first ?? ""
    }
}

extension Array where Element == RocketResponse {
    func toRocketModel() -> [RocketModel] {
        return self.map { RocketModel(rocket: $0) }
    }
}
