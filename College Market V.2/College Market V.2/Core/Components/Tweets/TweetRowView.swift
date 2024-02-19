//
//  TweetRowView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import SwiftUI
import Kingfisher
struct TweetRowView: View {
    // @Binding var Images: [UIImage]
    let tweet: Tweet
    let images: [String]
    
    //added images: [UIImage]
    var body: some View {
        VStack(alignment: .leading) {
            if let user = tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    
                    
                
                        
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 30, height: 30)
                        
                        
                        
                        
                    
                    
                    //user info and tweet caption
                    VStack(alignment: .leading, spacing: 4){
                        
                        HStack {
                           // Text(user.fullname)
                             //   .font(.subheadline).bold()
                                
                               // .foregroundColor(.black)
                            Text("@\(user.username)")
                                .font(.subheadline).bold()
                                .foregroundColor(.black)
                                .offset(y: 5)
                               // .foregroundColor(.gray)
                              //  .font(.caption)
                            
                            // Text("2w")
                            //  .foregroundColor(.gray)
                            //  .font(.caption)
                        }
                    }
                }
                        
                        
                        
                        
                        // Text(tweet.caption)
                        // .font(.subheadline)
                        //  .multilineTextAlignment(.leading)
                        /*
                         ForEach(tweet.imageUrls ?? [], id: \.self) { imageUrl in
                         // Assuming you have a custom ImageView that can load an image from a URL
                         ImageView(url: imageUrl)
                         .aspectRatio(contentMode: .fit)
                         .frame(height: 40)
                         
                         */
                    
                //Group{
                //showcase a default image if no image is available.
                    ImageView(url: tweet.imageUrls?[0] ?? "")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 170)
                        .cornerRadius(8)
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Ellipse()
                                        .foregroundColor(.white)
                                        .frame(width: 45, height: 30)
                                    
                                    
                                    
                                        .overlay (
                                            Ellipse()
                                                .stroke(Color.black, lineWidth: 0)
                                        )
                                    
                                        .overlay(
                                            Text("$\(String(format: "%.2f", tweet.likes))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 8))
                                                .padding(4)
                                                .bold()
                                        )
                                }
                                .offset(x: -10, y: -15)
                            }
                        )
                if tweet.caption.count > 50 {
                    Text(String(tweet.caption.prefix(50)) + "...")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding(5)
                        .foregroundColor(.black)
                    //    .bold()
                        
                } else {
                    Text(tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .padding(5)
                        .foregroundColor(.black)
                       // .bold()
                      //  .background(Color.black.opacity(0.5))
                }
              /*
                if tweet.likes.count < 4 {
                    
                    if tweet.caption.count > 30 {
                        HStack {
                            Text("$\(tweet.likes)")
                                .foregroun\dColor(.black)
                            
                            
                            
                            Circle()
                                .fill(.black)
                            Text(String(tweet.caption.prefix(30)) + "...")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                        }
                    }
                    
                    else {
                        
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                else {
                    if tweet.caption.count > 30 {
                        HStack {
                            Text("$\(tweet.likes.prefix(4) + "...")")
                                .foregroundColor(.black)
                            
                            
                            
                            Circle()
                                .fill(.black)
                            Text(String(tweet.caption.prefix(30)) + "...")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.black)
                        }
                    }
                    
                    else {
                        Text("$\(tweet.likes.prefix(4) + "...")")
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                
            */
                    
                    
                    
                
                 
                /*
                        .overlay(
                            VStack(alignment: .leading) {
                                if tweet.caption.count > 50 {
                                    Text(String(tweet.caption.prefix(50)) + "...")
                                        .font(.subheadline)
                                        .multilineTextAlignment(.leading)
                                        .padding(5)
                                        .background(Color.black.opacity(0.5))
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                        .alignmentGuide(.leading, computeValue: { _ in -180 })
                                } else {
                                    Text(tweet.caption)
                                        .font(.subheadline)
                                        .multilineTextAlignment(.leading)
                                        .padding(5)
                                      //  .background(Color.black.opacity(0.5))
                                        .foregroundColor(.black)
                                        .cornerRadius(5)
                                        .alignmentGuide(.leading, computeValue: { _ in 180 })
                                }
                            })
                            */
                
                
              //  Text(tweet.condition)
              //  }}
                //.offset(x: 27)
                            
                        }
                 //  Spacer()
                    }
        
                
                }
            }
        
    
    /*
     HStack {
     Button {
     
     } label: {
     Image(systemName: "bubble.left")
     .font(.subheadline)
     }
     Spacer()
     Button {
     
     } label: {
     Image(systemName: "bubble.left")
     .font(.subheadline)
     }
     Spacer()
     Button {
     
     } label: {
     Image(systemName: "bubble.left")
     .font(.subheadline)
     }
     Spacer()
     Button {
     
     } label: {
     Image(systemName: "bubble.left")
     .font(.subheadline)
     }
     }
     .foregroundColor(.gray)
     .padding()
     
     //   Divider()
     }
     
     }
     }
     */
    
    /*
    struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
    TweetRowView()
      }
    }
    
    */

