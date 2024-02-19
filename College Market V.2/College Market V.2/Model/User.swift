//
//  User.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/27/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
   
}
