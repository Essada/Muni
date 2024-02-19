//
//  ChatView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/7/24.
//
/*
import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var messageText = ""
    @State private var idlist: [String] = []
    @State var mydict = [String: Any]()
   
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                if !mydict.isEmpty {
                    ForEach(mydict.keys.sorted(), id: \.self) { key in
                        NavigationLink(
                            destination: ChatPage(items: mydict[key] as! [String]),
                            label: {
                                Text(key)
                            }
                                
                        )
                        .navigationBarBackButtonHidden(true)
                        
                        /*
                         if !mydict.isEmpty {
                         ForEach(mydict.keys.sorted(), id: \.self) { key in
                         VStack(alignment: .leading) {
                         Text("Key: \(key)")
                         .font(.headline)
                         if let messages = mydict[key] as? [String] {
                         ForEach(messages, id: \.self) { mess in
                         Text("Message: \(mess)")
                         */
                    }
                    
                    
                    
                    
                    
                    
                    
                    TextField("Type your message...", text: $messageText)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Send") {
                        guard (viewModel.userSession?.uid) != nil else {
                            print("DEBUG: User is not logged in.")
                            return
                        }
                        viewModel.sendDirectMessage(recipientID: "W2Ank7L90yOMONbxEN6RQxN6xbE2", content: messageText)
                        messageText = ""
                    }
                }
            }
                    .navigationTitle("Chat")
                    .onAppear {
                        if !didfetc=
                        updateMyDict()
                        viewModel.fetchMessageHistory(forRecipient: "W2Ank7L90yOMONbxEN6RQxN6xbE2")
                    }
            }
        }
    
    
    
    
    public func updateMyDict() {
        for message in viewModel.messages {
            if var existingArray = mydict[message.senderID] as? [String] {
                existingArray.append(message.content)
                mydict[message.senderID] = existingArray
            } else {
                mydict[message.senderID] = [message.content]
            }
            
        }
    }
}
*/


/*
import SwiftUI
import Combine

struct ChatView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var messageText = ""
    @State private var idlist: [String] = []
    @State private var mydict = [String: Any]()
    @State private var cancellables: Set<AnyCancellable> = []
    @State var recipient = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                 if !mydict.isEmpty {
                 ForEach(mydict.keys.sorted(), id: \.self) { key in
                 NavigationLink(
                 destination: ChatPage(items: mydict[key] as! [String]),
                 label: {
                 Text(key)
                 }
                 )
                 .navigationBarBackButtonHidden(true)
                 }
                 }
                 
                
                
            }
                TextField("Type your message...", text: $messageText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Send") {
                    guard (viewModel.userSession?.uid) != nil else {
                        print("DEBUG: User is not logged in.")
                        return
                    }
                    viewModel.sendDirectMessage(recipientID: recipient, content: messageText, participants: ["F3XQLEnuUNdoJOFxo3G5B9uFW1Y2", "W2Ank7L90yOMONbxEN6RQxN6xbE2"])
                    messageText = ""
                }
                
            }
            .navigationTitle("Chat")
            .onAppear {
                updateMyDict()
                viewModel.fetchMessageHistory(forRecipient: recipient)
                
                // Set up live updates using Combine
                viewModel.$messages
                    .sink(receiveValue: { _ in
                        updateMyDict()
                    })
                    .store(in: &cancellables)
            }
        }
    }
    
    
    public func updateMyDict() {
        for message in viewModel.messages {
            if var existingArray = mydict[message.senderID] as? [String] {
                if !existingArray.contains(message.content) {
                    existingArray.append(message.content)
                    mydict[message.senderID] = existingArray
                }
            } else {
                mydict[message.senderID] = [message.content]
            }
        }
    }
    

    /*
     public func updateMyDict() {
     guard let currentUserID = viewModel.userSession?.uid else {
     // If the current user is not logged in, exit the function
     return
     }
     
     for message in viewModel.messages {
     // Check if the current user is part of the participants list
     if message.participants.contains(currentUserID) == true  {
     // Use the participants list as the key
     let key = message.participants.joined(separator: "-")
     
     // Update messages only for the current user
     if var existingArray = mydict[key] as? [String] {
     if !existingArray.contains(message.content) {
     existingArray.append(message.content)
     mydict[key] = existingArray
     }
     } else {
     mydict[key] = [message.content]
     }
     }
     }
     
     }
     }
     */
}
*/

import SwiftUI
import Combine

import Kingfisher
struct ChatView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var messageText = ""
    @State private var cancellables: Set<AnyCancellable> = []
    @State var recipient = ""
    @Binding var messagepic: String
    @Binding var seller: String
    @Environment(\.presentationMode) var PresentationMode
    
    var body: some View {
       // ScrollView{
            NavigationView {
                
                
                
                VStack {
                    
                    
                    // KFImage(URL(string: messagepic))
                    //    .resizable()
                    //    .scaledToFill()
                    //    .clipShape(Circle())
                    //    .frame(width: 48, height: 48)
                    //    .offset(x:50)
                    HStack {
                        Button {
                            PresentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                        }
                        .offset(x: -100, y: 10)
                        

                        //Image(systemName: "house")
                        KFImage(URL(string: messagepic))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 30, height: 30)
                            .offset(x:-80, y: 10)
                        
                        Text(seller)
                            .bold()
                            .offset(x: -70, y: 10)
                            .font(.title2)
                        
                        
                        
                    }
                    .padding()
                    Spacer()
                    Divider()
                        //.offset(y: 10)
                        
                        
                        
                       
                        
                        
                
                    
                    
                    
                        List(viewModel.messages.filter { message in
                            message.participants.contains(viewModel.currentUser?.id ?? "") &&
                            message.participants.contains(recipient)
                        }) { message in
                            ChatBubble(message: message, viewModel: viewModel)
                                .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                                .listRowSeparatorTint(.clear)
                        }
                        .listStyle(InsetListStyle())
                        
                    
                    HStack {
                        TextField("Type your message...", text: $messageText)
                            .padding()
                            .background(
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .strokeBorder(Color.black, lineWidth: 1)
                                        .frame(height: 30)
                                )
                           // .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                        
                        Button("Send") {
                            guard (viewModel.userSession?.uid) != nil else {
                                print("DEBUG: User is not logged in.")
                                return
                            }
                            viewModel.sendDirectMessage(recipientID: recipient, content: messageText, participants: [viewModel.userSession?.uid ?? "", recipient], imageurl: viewModel.currentUser?.profileImageUrl ?? "")
                            
                            messageText = ""
                        }
                    }
                    .padding()
                }
                
                
                
                .onAppear {
                    viewModel.fetchMessageHistory(forRecipient: recipient)
                    
                    // Set up live updates using Combine
                    viewModel.$messages
                        .sink(receiveValue: { _ in })
                        .store(in: &cancellables)
                }
                
                
                
            }
            .navigationBarHidden(true)
            
            
            
            
      //  }
    }
}

struct ChatBubble: View {
    var message: Message
    @ObservedObject var viewModel: AuthViewModel
    var body: some View {
        
        HStack {
            if message.senderID == viewModel.currentUser?.id {
            Spacer()
            }
         //   .trailing . leading
            VStack(alignment: message.senderID == viewModel.currentUser?.id ? .trailing: .leading) {
                HStack {
                   // Text(message.senderID)
                    
                        //.font(.caption)
                   
                    /*
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                   */
                    if (message.senderID == viewModel.currentUser?.id) {
                        Text(message.content)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    else {
                        Text(message.content)
                            .padding(10)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
            }
            
            if message.senderID != viewModel.currentUser?.id {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel() // Make sure to initialize your view model accordingly
        let placeholderImageURL = "https://example.com/placeholder.jpg" // Provide a placeholder image URL for testing
        
        return ChatView(viewModel: viewModel, messagepic: Binding.constant(placeholderImageURL), seller: Binding.constant("Adame"))
            .environmentObject(viewModel)
    }
}
