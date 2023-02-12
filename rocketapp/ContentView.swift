//
//  ContentView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 10/02/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            SplashScreenView()
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
    }
}

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
        }.sheet(isPresented: $showRocketList, content: {
            NavigationView {
                RocketListView()
            }
        })
    }
}
