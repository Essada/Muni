//
//  ProfileView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .MyPosts
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    @ObservedObject var viewModel: ProfileViewModel
    
    
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
           // userInfoDetails
            Group {
                tweetFilterBar
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.tweets) { tweet in
                            TweetRowView(tweet: tweet, images: tweet.imageUrls ?? [])
                                .padding()
                        }
                        
                        
                    }
                }
            }
            .offset(y: 30)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

/*
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
)
    }
}
*/
extension ProfileView {
    var headerView: some View {
        
            ZStack(alignment: .bottomLeading) {
                Color(.systemBlue)
                    .ignoresSafeArea()
                VStack{
                    Button {
                        mode.wrappedValue.dismiss()
                        
                    }
                label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width:20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16, y: -4)
                }
                    
                    KFImage(URL(string: viewModel.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 72, height: 72)
                        .offset(x:16, y:24)
                }
            }
            .frame(height: 96)
        }
    
    var actionButtons: some View {
        
        HStack {
          //  Spacer()
            
          //  Image(systemName: "bell.badge")
           //     .font(.title3)
           //     .padding(6)
             //   .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            Spacer()
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline.bold())
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius:20).stroke(Color.gray, lineWidth:0.75))
               
            }

        }
        .padding(.trailing)
    }
   
    /*
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
       
            
            HStack(spacing: 24) {
                HStack {
                    
                }
                
                HStack {
                    
                }
                
            }
            .foregroundColor(.gray)
            .font(.caption)
            
            //UserStatsView()
             //   .padding(.vertical)
        }
        .padding(.horizontal)
        
        
        
        
    }
     */
    
    var tweetFilterBar: some View {
        
        HStack {
            
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) {
                item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        //if the item equals the filter we hover over, make it bold else make it regular
                        .fontWeight(selectedFilter == item ? .semibold : .regular )
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        //gives everything on the same level if we have capsule on everything and just change background color
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                        //makes slide over smoothly
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }
                    else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                
                
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                
                    
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
       
    }
        
    }


