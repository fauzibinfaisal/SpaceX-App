//
//  FailedView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct FailedView: View {
    var error: String
    var onRetry: () -> Void
    
    var body: some View {
        VStack (spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(error)
                .font(.headline)
                .foregroundColor(.red)
            
            Button(action: onRetry) {
                Text("Retry").fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
            }.background(Color.blue)
                .cornerRadius(8)
        }.padding(16)
    }
}
