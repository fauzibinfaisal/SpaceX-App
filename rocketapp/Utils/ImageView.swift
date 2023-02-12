//
//  ImageView.swift
//  rocketapp
//
//  Created by Gop-c2s2-f on 11/02/23.
//

import SwiftUI

struct ImageView: View {
    @State private var image: UIImage? = nil
    @State private var isLoading = false
    let urlString: String
    let placeholder: Image?

    init(urlString: String, placeholder: Image? = Image(systemName: "circle.slash")) {
        self.urlString = urlString
        self.placeholder = placeholder
    }

    var body: some View {
        ZStack {
            if self.image != nil {
                Image(uiImage: self.image!)
                    .resizable()
            } else if self.isLoading {
                ActivityIndicator(isAnimating: self.$isLoading, style: .large)
            } else {
                placeholder ?? Image(systemName: "circle.slash")
            }
        }
        .onAppear {
            self.loadImage()
        }
    }

    private func loadImage() {
        self.isLoading = true
        ImageLoader.loadImage(from: self.urlString) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.image = image
                    self.isLoading = false
                }
            case .failure:
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
}

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}


//struct ImageView: View {
//    @State private var image: UIImage? = nil
//    let urlString: String
//    let placeholder: Image?
//
//    init(urlString: String, placeholder: Image? = Image(systemName: "circle.slash")) {
//        self.urlString = urlString
//        self.placeholder = placeholder
//    }
//
//    var body: some View {
//        ZStack {
//            if self.image != nil {
//                Image(uiImage: self.image!)
//                    .resizable()
//            } else {
//                placeholder ?? Image(systemName: "circle.slash")
//            }
//        }
//        .onAppear {
//            self.loadImage()
//        }
//    }
//
//    private func loadImage() {
//        guard let url = URL(string: self.urlString) else { return }
//
//        DispatchQueue.global().async {
//            if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.image = uiImage
//                }
//            }
//        }
//    }
//}
