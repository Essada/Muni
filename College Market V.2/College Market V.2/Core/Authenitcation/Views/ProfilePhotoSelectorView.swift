//
//  ProfilePhotoSelectorView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/26/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewmodel: AuthViewModel
    var body: some View {
        VStack {
            AuthenticationHeaderView(title1: "Setup account", title2: "Selected a profile photo")
            Button{
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                       // .renderingMode(.template)
                        //.foregroundColor(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                        .clipShape(Circle())
                        
                }
                else {
                    Text("Add Image")
                }
                
            }
         //   when sheet dismisses, load our profile image into that spot.
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
                 
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage{
                Button {
                    viewmodel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

        

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
