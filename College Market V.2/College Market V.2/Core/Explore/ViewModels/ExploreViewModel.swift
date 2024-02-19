//
//  ExploreViewModel.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/27/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchbleUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
        
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
        }
    }
}
