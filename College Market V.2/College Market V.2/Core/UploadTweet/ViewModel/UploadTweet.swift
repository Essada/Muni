//
//  UploadTweet.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/27/23.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

/*
class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    //added images: [UIImage]
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                self.didUploadTweet = true
            } else {
                //show error message to user
            }
        }
    }
    
*/
 /*
     func uploadTweet(caption: String, completion: @escaping (Bool) -> Void) {
     guard let uid = Auth.auth().currentUser?.uid else {
     completion(false)
     return
     }
     
     let data: [String: Any] = [
     "uid": uid,
     "caption": caption,
     "likes": 0,
     "timestamp": Timestamp(date: Date()),
     ]
     
     Firestore.firestore().collection("tweets")
     .document().setData(data) { error in
     if let error = error {
     print("DEBUG: failed to upload tweet with error: \(error.localizedDescription)")
     completion(false)
     return
     }
     
     completion(true)
     }
     }
     
     }
     
    */
class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    let service = TweetService()
    //added likes
    func uploadTweet(withCaption caption: String, images: [UIImage], likes: Double, description: String, condition: String) {
        guard !images.isEmpty else {
               // No images to upload, proceed with uploading the tweet without images
            self.service.uploadTweet(caption: caption, imageUrls: [], likes: likes, description: description, condition: condition) { success in
                   if success {
                       self.didUploadTweet = true
                   } else {
                       // Handle error
                       self.didUploadTweet = false
                   }
               }
               return
           }
        
        
        
        var uploadedImageUrls: [String] = []
        var uploadedImageCount = 0
        
        // Upload each image and collect their URLs
        for image in images {
            print(image)
            ImageUploader.uploadImage(image: image) { imageUrl in
                uploadedImageCount += 1
                uploadedImageUrls.append(imageUrl)
                
                // Check if all images are uploaded
                if uploadedImageCount == images.count {
                    // All images uploaded, now upload the tweet with image URLs
                    self.service.uploadTweet(caption: caption, imageUrls: uploadedImageUrls, likes: likes, description: description, condition: condition) { success in
                        if success {
                            self.didUploadTweet = true
                        } else {
                            // Handle error
                            self.didUploadTweet = false
                        }
                    }
                }
            }
        }
    }
}
