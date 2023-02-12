//
//  RocketDetailView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct RocketDetailView: View {
    @ObservedObject var viewModel: RocketDetailViewModel
    
    init(rocketId: String) {
        viewModel = RocketDetailViewModel(rocketId: rocketId)
    }
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .loading:
                LoadingView()
            case .success(let rocketDetail):
                RocketDetailSuccessView(model: rocketDetail)
            case .failed(let errorMessage):
                FailedView(error: errorMessage) {
                    self.viewModel.fetchRocketDetail()
                }
            }
        }.navigationBarTitle("Rocket Info")
    }
}

private struct RocketDetailSuccessView: View {
    let model: RocketDetailModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ImageView(urlString: model.images.first ?? "")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

                Text(model.name)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

                Text(model.description).font(.caption)
                Text("Cost per Launch: $ \(model.costPerLaunch)").font(.subheadline)
                Text("Country: \(model.country)").font(.subheadline)
                Text("First Flight: \(model.firstFlight ?? "-")").font(.subheadline)
            }.padding(16)
        }
    }
}
