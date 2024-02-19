//
//  PostStruct2.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/5/24.
//
/*
import SwiftUI
import Kingfisher


struct PostStruct2: View {
    let tweet: Tweet
    
    @State private var refreshID = UUID()

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                TabView {
                    ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                        ImageView(url: imageUrl)
                            .scaledToFill()
                            .frame(width: 170, height: 170)
                            .cornerRadius(8)
                            // Use a new UUID for each ImageView
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 170)
            }
        }
    }
}
*/
