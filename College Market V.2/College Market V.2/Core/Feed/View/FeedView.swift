//
//  FeedView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import SwiftUI

struct FeedView: View {
    @State private var isShowingNewView = false
    @Environment(\.presentationMode) var PresentationMode
    @State private var showNewView = false
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    @State private var selectedTweet: Tweet?
    @State private var searchText = ""
 
    var body: some View {
        /*
        ChatView(viewModel: AuthViewModel())
         */
        
        VStack {
            HStack {
                Text("Muni")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.blue)
                    .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 2)
                Text("Marketplace")
                    .bold()
                    .foregroundColor(.black)
                    .font(.title3)
                
            }
            
            Spacer()
            Spacer()
            SearchBar(text: $searchText)
                .padding(.horizontal)
                
            
                                
            Spacer()
            ZStack(alignment: .bottomTrailing){
               
                  
                
                    
                
                        
                    ScrollView{
                        
                        LazyVGrid(columns: [GridItem(), GridItem()], spacing:15){
                            
                            ForEach(viewModel.filteredTweets(for: searchText)) { tweet in
                                
                                Button {
                                    //new
                                    selectedTweet = tweet
                                    isShowingNewView.toggle()
                                    
                                    
                                } label: {
                                    VStack {
                                        TweetRowView(tweet: tweet, images: tweet.imageUrls ?? [])
                                            .padding(8)
                                            .background(Color.white) // Apply a white background
                                            .cornerRadius(10) // Apply rounded corners
                                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2) // Apply a subtle shadow
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.black.opacity(0.1), lineWidth: 1) // Add a subtle border
                                            )
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                    // .foregroundColor(Color(.black))
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                //  .background(Color.white)
                                
                                //  .overlay(
                                //     RoundedRectangle(cornerRadius: 20) // Adjust corner radius as needed
                                //       .stroke(Color.gray, lineWidth: 1)
                                //  )
                                
                                
                                
                                /*
                                 .fullScreenCover(isPresented: $isShowingNewView, content: {
                                 PostStruct2(tweet: selectedTweet ?? tweet)
                                 //ViewTweetsGoin(tweet: selectedTweet ?? tweet)
                                 //    ViewTweetsGoInPreview()
                                 
                                 
                                 })
                                 
                                 }
                                 .padding(10)
                                 */
                                .fullScreenCover(isPresented: Binding(
                                    get: { isShowingNewView },
                                    set: { newValue in
                                        if newValue {
                                            isShowingNewView = false
                                            DispatchQueue.main.async {
                                                isShowingNewView = true
                                            }
                                        } else {
                                            isShowingNewView = false
                                        }
                                    }
                                )) {
                                    //PostStruct2(tweet: selectedTweet ?? tweet)
                                    //ViewTweetsGoInPreview(tweet: selectedTweet ?? tweet)
                                    AfterclickingonpostView(tweet: selectedTweet ?? tweet)
                                }
                            }
                            .padding(10)
                        }
                    }
                
                    
                
                
                //   }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                //      }
                
                //    }
                //     .background(Color(.white))
                //new
                
                
                
                
                //passing a whole nother view into
                //a foreach. Didnt knwoi you could do this
                /*
                 ForEach(viewModel.tweets) { tweet in
                 // NavigationLink(destination: ViewTweetsGoin(tweet: tweet)) {
                 
                 
                 
                 TweetRowView(tweet: tweet)
                 .padding()
                 .foregroundColor(Color(.black))
                 // .foregroundColor(Color(.black))
                 }
                 //.foregroundColor(Color(.black))
                 
                 }
                 }
                 
                 
                 */
                
                
                Button {
                    showNewTweetView.toggle()
                } label: {
                    
                
                   /* Image("Home")
                                           .resizable()
                                           .renderingMode(.template)
                                           .frame(width: 28, height: 28)
                                           .padding()
                    
                    Image(systemName: "plus")
                }
                
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                    */
                    Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .padding(12)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2) // Add a stroke around the circle
                                    .frame(width: 48, height: 48) // Adjust the size of the circle
                            )
                    }
                .padding()
                .fullScreenCover(isPresented: $showNewTweetView) {
                    NewTweetView()
                    
                    
                    
                    
                    
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


extension View {
    func withoutAnimation(action: @escaping () -> Void) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) {
            action()
        }
    }
}

