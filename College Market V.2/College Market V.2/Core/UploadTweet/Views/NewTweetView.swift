//
//  NewTweetView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/25/23.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @State private var likes = 0.0
    @State private var caption = ""
    @State private var images: [UIImage] = []
    @State private var description = ""
    @State private var condition = ""
    @State private var isPressed: Bool = false
    @Environment(\.presentationMode) var PresentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    //knows we have view open, will dismiss it.
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack{
                    
                    
                    
                    HStack{
                        Button {
                            PresentationMode.wrappedValue.dismiss()
                            
                        }
                    label: {
                        Text("Cancel")
                            .foregroundColor(Color(.systemBlue))
                           
                    }
                    .offset(x: 30)
                        
                        Spacer()
                        
                        Button {
                            //normally, withCaption. // added likes
                            viewModel.uploadTweet(withCaption: caption, images: images, likes: likes, description: description, condition: condition)
                            
                            
                        //    *****userSession == nil
                        } label: {
                            Text("Post")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color(.systemBlue))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .offset(x: -25)
                            
                        }
                    }
                    
                    .padding()
                    .offset(y: -30)
                    /*
                     HStack(alignment: .top) {
                     if let user = authViewModel.currentUser {
                     KFImage(URL(string: user.profileImageUrl))
                     .resizable()
                     .clipShape(Circle())
                     .frame(width: 64, height: 64)
                     }
                     */
                    
                    
                    Text("Add Photos")
                        .frame(alignment: .leading)
                        .offset(x: -130, y: -30)
                        .font(.title3)
                        .padding()
                    
                    
                   PostStructureView(selectedImages: $images)
                       .offset(y: -60)
                    
                    
                        
                    //----------------------------------------------------------------------------
                    //$caption
                    
                    
                    
                    TextField("Title:", text: $caption,  axis: .vertical)
                    
                        .frame(width: 335, height: 40)
                        .padding()
                    
                        .lineLimit(1...3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .offset(y: -80)
                        
                    
                    
                    
                    PriceTextField(price: $likes)
                    
                    
                        .frame(width: 335, height: 40)
                        .padding()
                    
                        .lineLimit(1...3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .offset(y: -70)
                    
                    Text("Condition")
                        .font(.title3)
                        .bold()
                        .offset(x: -140, y: -50)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                condition = "New"
                                if isPressed == false {
                                     isPressed = true
                                }
                                else {
                                    isPressed = false
                                }
                            } label: {
                                Text("New")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(isPressed && condition == "New" ? Color(.gray) : Color(.systemBlue))
                                    .clipShape(Rectangle())
                                    .cornerRadius(15)
                                    .fixedSize()
                                    .padding(.horizontal, 3)
                            }
                            Button {
                                condition = "Used - Like New"
                                if isPressed == false {
                                     isPressed = true
                                }
                                else {
                                    isPressed = false
                                }
                            } label: {
                                Text("Used - Like New")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(isPressed && condition == "Used - Like New" ? Color(.gray) : Color(.systemBlue))
                                    .clipShape(Rectangle())
                                    .cornerRadius(15)
                                    .fixedSize()
                                    .padding(.horizontal, -5)
                                
                            }
                            
                            
                            Button {
                                condition = "Used - Good"
                                if isPressed == false {
                                     isPressed = true
                                }
                                else {
                                    isPressed = false
                                }
                            } label: {
                                Text("Used - Good")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(isPressed && condition == "Used - Good" ? Color(.gray) : Color(.systemBlue))
                                    .clipShape(Rectangle())
                                    .cornerRadius(15)
                                    .fixedSize()
                                    .padding(.horizontal, 3)
                                
                                
                            }
                            
                            Button {
                                condition = "Used - Fair"
                                if isPressed == false {
                                     isPressed = true
                                }
                                else {
                                    isPressed = false
                                }
                            } label: {
                                Text("Used - Fair")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(isPressed && condition == "Used - Fair" ? Color(.gray) : Color(.systemBlue))
                                    .clipShape(Rectangle())
                                    .cornerRadius(15)
                                    .fixedSize()
                                    .padding(.horizontal, -4)
                                
                                
                            }
                            
                            
                        }

                    }
                    
                        .offset(x: 20, y: -45)
                    VStack {
                        TextField("Description (Recommended)", text: $description,  axis: .vertical)
                        
                            .frame(width: 335, height: 40)
                            .padding()
                        
                            .lineLimit(1...3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .offset(y: -30)
                        
                        
                        //.offset(x: 100)
                        
                        Button {
                            
                            viewModel.uploadTweet(withCaption: caption, images: images, likes: likes, description: description, condition: condition)
                        } label: {
                            Text("Publish") // Text on the button
                                .font(.title3)
                                .frame(width: 335, height: 18)
                                           .foregroundColor(.white) // Text color
                                           .padding() // Padding around the text
                                           .background(Color.blue) // Background color of the button
                                           .cornerRadius(10)
                        }
                        .offset(y: -30)
                        .padding()

                        
                    }
                        
                        
                        
                        
                        
                        // TextArea("What's happening?", text: $caption)
                        
                        
                        
                        
                        
                    
                        
                        
                        //    PostStructureView(selectedImages: $images)
                    }
                    .navigationBarTitle("Sell", displayMode: .inline)
                    .bold()
                    .padding()
                    .offset(y: -20)
                    
                    
                }
                
                .onReceive(viewModel.$didUploadTweet) { success in
                    if success {
                        PresentationMode.wrappedValue.dismiss()
                    }
                    
                }
                
            }
        }
    
    
}
        

   
struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        
        NewTweetView()
            .environmentObject(AuthViewModel())
    }
}


/*
/*
 HStack(alignment: .top) {
 if let user = authViewModel.currentUser {
 KFImage(URL(string: user.profileImageUrl))
 .resizable()
 .clipShape(Circle())
 .frame(width: 64, height: 64)
 }
 */

VStack{
    
    HStack(spacing: 35) {
        Group {
            ZStack {
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .overlay(
                        Circle()
                            .stroke(Color.green, lineWidth: 1)
                            .frame(width: 30, height: 30)
                        
                    )
                Text("1")
                    .foregroundColor(.black)
                
            }
            
            Text("Upload Pictures")
                .bold()
                .padding()
                .offset(x: -37)
        }
        .offset(x: -30)
        
        Group {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 1)
                        .frame(width: 30, height: 30)
                    
                )
        }
      //  .offset(x: 25)
    }
    
  //  .offset(x: -37)
    
        //PostStructureView(selectedImages: $images)
          //  .padding()
    
    /*
    Button {
        
    } label: {
        ZStack {
            
            Rectangle()
                .cornerRadius(25)
                .frame(width: 310, height: 250)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.green, lineWidth: 2)
                )
                .padding()
            
            
            Image(systemName: "plus")
                .foregroundColor(Color(.black))
              //  .bold()
                .padding()
                .font(.title)
            
            
        }
        // .padding()
    }
*/
*/
struct PriceTextField: View {
    @Binding var price: Double
    @State private var isEditing = false
    
    var body: some View {
        HStack(spacing: 0) {
            if !isEditing {
                Text("Price:")
                    .foregroundColor(.secondary)
                   // .padding(.leading, 16)
            }
            
            if isEditing || price != 0.0 {
                Text("$")
                    .foregroundColor(.black)
                    .padding(.trailing, 4)
            }
            
            TextField("", text: Binding(
                get: {
                    if price == 0.0 {
                        return ""
                    } else {
                        return String(format: "%.2f", price)
                    }
                },
                set: { newValue in
                    // Parse the input text to a Double
                    if let value = Double(newValue) {
                        self.price = value
                        self.isEditing = true
                    }
                }
            ), onEditingChanged: { editing in
                self.isEditing = editing
            })
            .keyboardType(.decimalPad)
            .frame(height: 40)
            .padding(.vertical, 8)
            .cornerRadius(8)
        }
    }
}


