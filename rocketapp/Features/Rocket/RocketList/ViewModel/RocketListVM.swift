//
//  RocketListVM.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//
import Foundation

class RocketListViewModel: ObservableObject {
    @Published var state = UIState<[RocketModel]>.loading
    private let rocketService: RocketService
    
    init() {
        self.rocketService = RocketService()
        self.fetchRockets()
    }
    
    func fetchRockets() {
        state = .loading
        rocketService.fetchRocketList { (result) in
            switch result {
            case .success(let rockets):
                DispatchQueue.main.async {
                    let rocketModels = rockets.toRocketModel()
                    self.state = .success(rocketModels)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.state = .failed(error.localizedDescription)
                }
                
            }
        }
    }
}
