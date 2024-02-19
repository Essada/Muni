//
//  AuthViewModel.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/25/23.
//


import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift


/*
class AuthViewModel: ObservableObject {
    @Published var userSession: User?
    //if user logged in, store their session in this variable.
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession)")
    }
}
 */
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //Published reconfigures view
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    // If the user is logged in, store their session in this variable.
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        self.fetchUser()
        
    }
    
    func forceClearUserSession() {
        userSession = nil
    }
    
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Debug: failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email:String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            
            
            
            
            let data = ["email" : email, "username": username.lowercased(), "fullname": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                    
                }
            
        }
    }
    
    func signOut() {
        //sets user session to nil so we show login view.
        userSession = nil
        //signs user out on server side.
        
        try? Auth.auth().signOut()
    }
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                    
                }
        }
        
    }
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return }
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
            
        }
    }
    
    
    let messagingService = MessagingService()
    
    func sendDirectMessage(recipientID: String, content: String, participants: [String], imageurl: String) {
        guard let senderID = userSession?.uid else {
            // Handle not being logged in
            print("DEBUG: User is not logged in.")
            return
        }
        
        let message = Message(senderID: senderID, recipientID: recipientID, content: content, timestamp: Date(), participants: participants, imageurl: imageurl)
        messagingService.sendDirectMessage(message: message)
    }
    
    // Add methods for fetching message history, etc.
    
    @Published var messages: [Message] = []
    // ... (your existing code)
    
    func fetchMessageHistory(forRecipient recipientID: String) {
        guard let currentUserID = userSession?.uid else {
            print("DEBUG: User is not logged in.")
            return
        }
        
        Firestore.firestore().collection("messages")
        // .whereField("senderID", in: [currentUserID, recipientID])
            .whereField("recipientID", in: [currentUserID, recipientID])
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                let fetchedMessages = documents.compactMap { queryDocumentSnapshot -> Message? in
                    do {
                        return try queryDocumentSnapshot.data(as: Message.self)
                    } catch {
                        print("Error decoding message: \(error.localizedDescription)")
                        return nil
                    }
                }
                
                // Update messages on the main thread
                DispatchQueue.main.async {
                    self.messages = fetchedMessages
                }
            }
    }
    
    /*
     func fetchMessageHistory(forRecipient recipientID: String) {
     guard let currentUserID = userSession?.uid else {
     print("DEBUG: User is not logged in.")
     return
     }
     
     let chatParticipants = [currentUserID, recipientID].sorted()
     
     Firestore.firestore().collection("messages")
     .whereField("participants", arrayContains: chatParticipants)
     .order(by: "timestamp", descending: false)
     .addSnapshotListener { querySnapshot, error in
     guard let documents = querySnapshot?.documents else {
     print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
     return
     }
     
     let fetchedMessages = documents.compactMap { queryDocumentSnapshot -> Message? in
     do {
     return try queryDocumentSnapshot.data(as: Message.self)
     } catch {
     print("Error decoding message: \(error.localizedDescription)")
     return nil
     }
     }
     
     // Update messages on the main thread
     DispatchQueue.main.async {
     self.messages = fetchedMessages
     }
     }
     }
     }
     
     */
    
}

