//
//  Tweet.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/28/23.
//

import FirebaseFirestoreSwift
import Firebase
import SwiftUI

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let caption: String
    let timestamp: Timestamp
    let uid: String
    //from Int to Double
    var likes: Double
    var user: User?
    var description: String
    //new
    var imageUrls: [String]?
    var condition: String
    
    
    
    
    
}
