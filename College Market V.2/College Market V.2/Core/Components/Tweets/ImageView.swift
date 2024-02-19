//
//  ImageView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/1/24.
//

import SwiftUI

struct ImageView: View {
    let url: String

    var body: some View {
        // You may use a library like SDWebImageSwiftUI or KingfisherSwiftUI for image loading
        // Make sure to handle errors and placeholder images appropriately
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                EmptyView()
            }
        }
    }
}

