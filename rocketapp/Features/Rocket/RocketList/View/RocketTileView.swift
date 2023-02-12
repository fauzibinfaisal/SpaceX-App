//
//  RocketTileView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct RocketRowView: View {
    let rocket: RocketModel
    
    var body: some View {
        HStack (spacing: 12){
            ImageView(urlString: rocket.image)
                .frame(width: 70, height: 70)
                .cornerRadius(.infinity)
            VStack(alignment: .leading, spacing: 8) {
                Text(rocket.name)
                    .font(.headline)
                Text(rocket.description)
                    .font(.caption)
                    .lineLimit(3)
                    .foregroundColor(.gray)
            }
        }
    }
}
