//
//  SideMenuViewModel.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import Foundation

enum SideMenuViewModel: Int, CaseIterable {
    case profile
 //   case lists
    case bookmarks
    case logout
    
    var title: String {
        switch self {
        case .profile: return "Profile"
      //  case .lists: return "Lists"
        case .bookmarks: return "Saved Items"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
       // case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logout: return "arrow.left.square"
        }
    }
    //enums good for having list of strings.
    
}
