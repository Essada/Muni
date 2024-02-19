//
//  FeedViewModel.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/28/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    let service = TweetService()
    let userService = UserService()
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets() { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
                    
                }
                
            }
    
    func filteredTweets(for searchText: String) -> [Tweet] {
        if searchText.isEmpty {
            return tweets
        } else {
            let trimmedQuery = searchText.replacingOccurrences(of: " ", with: "").lowercased()
            return tweets.filter { tweet in
                let trimmedCaption = tweet.caption.replacingOccurrences(of: " ", with: "").lowercased()
                return trimmedCaption.contains(trimmedQuery)
            }
        }
    }
     
   
        }
    
    
    //[tweet1, tweet2, tweet3, tweet4]
