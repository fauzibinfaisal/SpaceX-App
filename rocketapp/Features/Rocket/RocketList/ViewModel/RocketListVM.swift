//
//  RocketListVM.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//
import Foundation

class RocketListViewModel: ObservableObject {
    @Published var state = UIState<[RocketModel]>.loading
    @Published var searchText = ""
    @Published var rocketModels = [RocketModel]()
    private let rocketService: RocketService
    
    var filteredRocketModels: [RocketModel] {
            return rocketModels.filter {
                searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    
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
                    self.rocketModels = rockets.toRocketModel()
                    self.state = .success(self.rocketModels)
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self.state = .failed(error.localizedDescription)
                }
                
            }
        }
    }
}
