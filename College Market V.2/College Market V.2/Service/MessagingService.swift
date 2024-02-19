//
//  MessageService.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/7/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class MessagingService {
    let db = Firestore.firestore()
    func sendDirectMessage(message: Message) {
        
        db.collection("messages")
            .addDocument(data: [
                "id": message.id,
                "senderID": message.senderID,
                "recipientID": message.recipientID,
                "content": message.content,
                "timestamp": Timestamp(date: message.timestamp), "participants": message.participants, "imageurl": message.imageurl
            ]) { error in
                if let error = error {
                    print("DEBUG: Failed to send message with error \(error.localizedDescription)")
                } else {
                    print("DEBUG: Message sent successfully.")
                }
            }
    }

    // Add more methods for fetching message history, etc.
}
