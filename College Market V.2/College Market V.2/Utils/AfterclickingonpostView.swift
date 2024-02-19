//
//  ViewTweetsGoInPreview.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/4/24.
//

import SwiftUI
import Kingfisher
//ViewTweetsGoInPreview = AfterclickingonpostView
struct AfterclickingonpostView: View {
    let tweet: Tweet
    //BIND THE MESSAGEPIC VARIABLE
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var PresentationMode
    @State private var refreshID = UUID()
    @State var messagepic: String = ""
    @State var seller: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Muni")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.blue)
                        .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 2)
                    Text("Shop")
                        .bold()
                        .foregroundColor(.black)
                        .font(.title3)
                }
    
                // .offset(y: 20)
                
                ScrollView {
                    
                    
                    VStack(alignment: .leading, spacing: 20) {
                        // Back Button
                        Button(action: {
                            PresentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color(.systemBlue))
                                .font(.title)
                        }
                        .padding(.horizontal)
                     //   .padding(.top, 40)
                        .padding(.bottom, 20)
                        
                        
                        // Image Carousel
                        ImageCarousel(tweet: tweet)
                            .frame(height: 300)
                            .padding(.horizontal)
                        
                        // Product Details
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "bookmark")
                                }
                                .padding(.top, 10)
                                .font(.title2)
                                
                                NavigationLink {
                                    ChatView(viewModel: AuthViewModel(), recipient: tweet.uid, messagepic: $messagepic, seller: $seller)
                                    
                                } label: {
                                    Image(systemName: "message")
                                }
                                .padding(.top, 10)
                                .font(.title2)
                                .foregroundColor(.blue)
                                
                            }
                            
                            Text(tweet.caption)
                                .font(.title)
                                .fontWeight(.bold)
                            Text("$\(String(tweet.likes))")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .background(Color.gray)
                            .padding(.horizontal)
                        
                        // Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Description:")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(tweet.description)
                                .font(.body)
                        }
                        .padding(.horizontal)
                        
                        // Seller
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Seller:")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(seller)
                                .font(.body)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        // Buttons
                        
                        
                    }
                    .padding(.top, 20)
                    .onAppear {
                        messagepic = tweet.user?.profileImageUrl ?? ""
                        seller = tweet.user?.username ?? ""
                    }
                }
            }
            
        }
    }
}
/*
        struct ImageCarousel: View {
            let tweet: Tweet
            
            var body: some View {
                /*
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                            KFImage(URL(string: imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 300)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                 */
                
                ScrollView(.horizontal) {
                TabView {
                ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                ImageView(url: imageUrl)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 330)
                }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(width: UIScreen.main.bounds.width, height: 330)
                }
                
                
                
                
                        }
                    }

*/
struct ImageCarousel: View {
    let tweet: Tweet
    
    var body: some View {
        ScrollView(.horizontal) {
            TabView {
                ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 330)
                        .border(Color.gray.opacity(0.5), width: 2) // Add border around the image
                        // Optional: Add corner radius for a rounded border
                        .padding(5) // Optional: Add padding around the image
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(width: UIScreen.main.bounds.width, height: 330)
        }
    }
}
   /*
                NavigationView {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Button {
                                    PresentationMode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(Color(.systemBlue))
                                }
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top, 40)
                            
                            ImageCarousel(tweet: tweet)
                                .frame(height: 330)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                            
                            HStack {
                                Text("Nike T-Shirt")
                                    .font(.headline)
                                Spacer()
                                Text("$50")
                                    .font(.headline)
                            }
                            .padding(.horizontal)
                            
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal)
                            
                            Text("Description:")
                                .font(.headline)
                                .padding(.horizontal)
                            Text(tweet.caption)
                                .padding(.horizontal)
                            
                            Text("Seller:")
                                .font(.headline)
                                .padding(.horizontal)
                            Text(seller)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                            HStack {
                                Button(action: {}) {
                                    Text("Bookmark")
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                Spacer()
                                NavigationLink(destination: ChatView(viewModel: authViewModel, recipient: tweet.uid, messagepic: $messagepic, seller: $seller)) {
                                    Text("Message")
                                        .fontWeight(.bold)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding()
                        }
                        .padding(.top, 20)
                        .onAppear {
                            messagepic = tweet.user?.profileImageUrl ?? ""
                            seller = tweet.user?.username ?? ""
                        }
                    }
                }
            }
        }

        struct ImageCarousel: View {
            let tweet: Tweet
            
            var body: some View {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                            KFImage(URL(string: imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 330)
                        }
                    }
                }
            }
        }
       /*
        /*
        
         NavigationView{
         
         ScrollView {
         VStack() {
         
         Button {
         PresentationMode.wrappedValue.dismiss()
         }
         label: {
         
         Image(systemName: "chevron.left")
         .foregroundColor(Color(.systemBlue))
         }
         .offset(x: -170, y: 40)
         ZStack() {
         
         VStack(alignment: .leading) {
         ScrollView(.horizontal) {
         TabView {
         ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
         ImageView(url: imageUrl)
         .scaledToFill()
         .frame(width: UIScreen.main.bounds.width, height: 330)
         }
         }
         .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
         .frame(width: UIScreen.main.bounds.width, height: 330)
         }
         }
         .offset(y: 60)
         
         }
         HStack {
         Text("Nike T-Shirt")
         .offset(x: -115, y: 70)
         
         
         Text("$50")
         .offset(x: 110, y: 70)
         }
         
         Button {
         
         } label: {
         Image(systemName: "bookmark")
         }
         .offset(x: -170, y: 86)
         
         NavigationLink {
         ChatView(viewModel: AuthViewModel(), recipient: tweet.uid, messagepic: $messagepic, seller: $seller)
         
         } label: {
         Image(systemName: "message")
         }
         .offset(x:-130, y:65)
         
         Divider()
         .background(Color.gray)
         .frame(width: 365, height: 1)
         .offset(x: 0, y: 75)
         
         Group {
         HStack {
         Text("Description: ")
         .offset(x: -130, y: 90)
         .bold()
         Text(tweet.caption)
         .offset(x: -130, y: 90)
         .bold()
         }
         Text("Seller: ")
         .offset(x: -150, y: 170)
         .bold()
         }
         Button {
         
         } label: {
         Text("Buy Now")
         .foregroundColor(.white)
         .bold()
         .frame(width: 320, height: 32)
         .background(Color(.systemBlue))
         .cornerRadius(8)
         
         .padding()
         
         }
         .offset(x: 50, y: 235)
         .offset(x: -50)
         
         Button {
         
         } label: {
         Text("Make An Offer")
         .foregroundColor(.white)
         .bold()
         .frame(width: 320, height: 32)
         .background(Color(.gray))
         .cornerRadius(8)
         
         .padding()
         
         }
         .offset(x: 50, y: 205)
         .offset(x: -50)
         
         }
         .onAppear {
         messagepic = tweet.user?.profileImageUrl ?? ""
         seller = tweet.user?.username ?? ""
         }
         }
         }
         }
         }
         
         */
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Button {
                        PresentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    // Image carousel
                    ZStack() {
                    
                    VStack(alignment: .leading) {
                    ScrollView(.horizontal) {
                    TabView {
                    ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                    ImageView(url: imageUrl)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 330)
                    }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(width: UIScreen.main.bounds.width, height: 330)
                    }
                    }
                    
                    
                    }
                    
                    HStack {
                        Text("Nike T-Shirt")
                        Spacer()
                        Text("$50")
                    }
                    .padding(.horizontal)
                    
                    // Your bookmark and message button code goes here
                    
                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                        .padding(.horizontal)
                    
                    Text("Description:")
                        .bold()
                        .padding(.horizontal)
                    Text(tweet.caption)
                        .padding(.horizontal)
                    
                    Text("Seller:")
                        .bold()
                        .padding(.horizontal)
                    
                    // Your Buy Now and Make An Offer buttons go here
                }
                .padding(.top, 20)
                .onAppear {
                    messagepic = tweet.user?.profileImageUrl ?? ""
                    seller = tweet.user?.username ?? ""
                }
            }
        }
    }
}
        */
       */

