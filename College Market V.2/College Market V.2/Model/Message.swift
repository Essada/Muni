//
//  Message.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/7/24.
//

import FirebaseFirestoreSwift
import Firebase
import SwiftUI

/*
struct Message: Hashable, Decodable {
    var senderID: String
    var recipientID: String
    var content: String
    var timestamp: Date
    var participants: [String]
}
*/
struct Message: Decodable, Identifiable {
    var id: String // Unique identifier
    var senderID: String
    var recipientID: String
    var content: String
    var timestamp: Date
    var participants: [String]
    var imageurl: String

    init(senderID: String, recipientID: String, content: String, timestamp: Date, participants: [String], imageurl: String) {
        // Create a unique identifier using a combination of sender ID, recipient ID, and timestamp
        self.id = "\(senderID)_\(recipientID)_\(timestamp.timeIntervalSince1970)"
        self.senderID = senderID
        self.recipientID = recipientID
        self.content = content
        self.timestamp = timestamp
        self.participants = participants
        self.imageurl = imageurl
    }
}
