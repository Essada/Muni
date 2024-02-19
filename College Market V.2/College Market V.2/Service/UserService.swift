//
//  UserService.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/27/23.
//

import Firebase
import FirebaseFirestoreSwift


struct UserService {
    //getting information form api about the user we are logged in as.
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                
                let users = documents.compactMap({ try?$0.data(as: User.self) })
                completion(users)
            }
    }
}
