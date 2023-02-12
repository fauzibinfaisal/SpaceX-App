//
//  RocketDetailViewModel.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

class RocketDetailViewModel: ObservableObject {
    @Published var state = UIState<RocketDetailModel>.loading
    @Published var rocket: RocketDetailModel?
    private let rocketId: String
    private let rocketService: RocketService
    
    init(rocketId: String) {
        self.rocketId = rocketId
        self.rocketService = RocketService()
        self.fetchRocketDetail()
    }
    
    func fetchRocketDetail() {
        self.rocketService.fetchRocket(id: self.rocketId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let rocket):
                let firstFlightDate = self.convertDateString(date: rocket.firstFlight ?? "", fromFormat: "yyyy-MM-dd", toFormat: "dd MMMM yyyy")
                let rocketModel = RocketDetailModel(
                    id: rocket.id,
                    images: rocket.flickrImages,
                    name: rocket.name,
                    description: rocket.description,
                    costPerLaunch: rocket.costPerLaunch ?? 0,
                    country: rocket.country  ?? "",
                    firstFlight: firstFlightDate)

                self.state = .success(rocketModel)
            case .failure(let error):
                self.state = .failed(error.localizedDescription)
            }
        }
    }
    
    func convertDateString(date: String, fromFormat: String, toFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        guard let date = dateFormatter.date(from: date) else {
            return date
        }
        
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
}
