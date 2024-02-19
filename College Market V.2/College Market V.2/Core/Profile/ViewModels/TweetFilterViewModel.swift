//
//  TweetFilterViewModel.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case MyPosts
    case replies
  //  case likes
    
    
    var title: String {
        switch self {
        case .MyPosts: return "My Posts"
        case .replies: return "Saved Items"
       // case .likes: return "Likes"
            
        }
    }
}

