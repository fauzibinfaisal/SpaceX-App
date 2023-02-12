//
//  SplashScreenView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 12/02/23.
//

import SwiftUI

struct SplashScreenView: View {

    @State private var showRocketList = false
    
    var body: some View {
        ZStack {
            Image(systemName: "paperplane.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showRocketList = true
            }
        }.compatibleFullScreen(isPresented: $showRocketList, content: {
            NavigationView {
                RocketListView()
                    .navigationBarTitle("Rocket List 🚀")
            }
        })
    }
}
