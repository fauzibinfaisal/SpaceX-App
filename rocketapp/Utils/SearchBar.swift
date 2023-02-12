//
//  SearchBar.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search Rockets", text: $text)
                .padding(.leading, 8)
                .padding(.vertical, 8)
                .font(.system(size: 16))
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10)
            if !text.isEmpty {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.leading, 8)
        .padding(.trailing, 8)
    }
}
//struct SearchBar: View {
//    @Binding var text: String
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass").foregroundColor(.gray)
//                .padding(.leading, 8)
//            TextField("Search rockets", text: $text)
//                .padding(.horizontal, 8)
//                .padding(.vertical, 4)
//                .font(.system(size: 16))
//
//            if !text.isEmpty {
//                Button(action: {
//                    self.text = ""
//                }) {
//                    Image(systemName: "xmark.circle.fill")
//                        .foregroundColor(.secondary)
//                }
//                .padding(.trailing, 8)
//            }
//        }
//        .background(Color(.systemGray6))
//        .padding(.horizontal, 10)
//        .padding(.vertical, 8)
//        .cornerRadius(10)
//
//    }
//}

struct SearchBar_Previews: PreviewProvider {
    @Binding var text: String

    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
