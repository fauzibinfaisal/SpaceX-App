//
//  RocketListView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct RocketListView: View {
    @ObservedObject var viewModel: RocketListViewModel
    
    init() {
        viewModel = RocketListViewModel()
    }
    
    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText).padding(.horizontal, 8)
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .success(_):
                RocketListSuccessView(rockets: viewModel.filteredRocketModels)
            case .failed(let error):
                FailedView(error: error) {
                    self.viewModel.fetchRockets()
                }
            }
        }
    }
}

struct RocketListSuccessView: View {
    let rockets: [RocketModel]
    
    var body: some View {
        List(rockets, id: \.id) { rocket in
            NavigationLink(destination: RocketDetailView(rocketId: rocket.id)) {
                RocketRowView(rocket: rocket)
            }
        }
    }
}
