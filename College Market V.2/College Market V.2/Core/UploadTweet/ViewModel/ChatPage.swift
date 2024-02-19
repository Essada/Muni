//
//  SwiftUIView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 1/10/24.
//

import SwiftUI
struct ChatPage: View {
    var items: [String]
    @Environment(\.presentationMode) var PresentationMode
    var body: some View {
        NavigationView{
            
                VStack {
                    Button {
                        PresentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Back")
                    }

                    List(items, id: \.self) { item in
                        Text(item)
                    }
                }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}
  

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        var items = ["Pickles", "Cheese"]
        ChatPage(items: items)
    }
}
