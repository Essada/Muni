//
//  TweetService.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/27/23.
//

import Firebase

struct TweetService {
    
    //added imageUrls
    /*
    func uploadTweet(caption: String, imageUrls: [String]?, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return }
        
        //im chaning this let to a var for imageupload
        var data = ["uid": uid, "caption" : caption, "likes": 0, "timestamp": Timestamp(date: Date())] as [String : Any]
        
        //new
        if let imageUrls = imageUrls {
                   data["imageUrls"] = imageUrls
               }
       
        //change from .document to adddocument
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error {
                    print("DEBUG: failed to upload tweet with error: \(error.localizedDescription)")
                    //added tweet
                    completion(false)
                    return
                }
                
                completion(true)
                
            }
    }
    
    */
    //added likes
    func uploadTweet(caption: String, imageUrls: [String]?, likes: Double, description: String, condition: String, completion: @escaping(Bool) -> Void) {
           guard let uid = Auth.auth().currentUser?.uid else { return }
           
        var data = ["uid": uid, "caption": caption, "likes": likes, "description": description, "condition": condition, "timestamp": Timestamp(date: Date())] as [String: Any]
           
           if let imageUrls = imageUrls {
               data["imageUrls"] = imageUrls
           }
           
           Firestore.firestore().collection("tweets").addDocument(data: data) { error in
               if let error = error {
                   print("DEBUG: failed to upload tweet with error: \(error.localizedDescription)")
                   completion(false)
               } else {
                   completion(true)
               }
           }
       }
    
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) } )
                completion(tweets)
            }
        
    }
    
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let tweets = documents.compactMap({ try? $0.data(as: Tweet.self) } )
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() }))
                
            }
    }
}

