//
//  RegistrationView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/25/23.
//

import SwiftUI


struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            VStack {
                
                
                NavigationLink(destination: ProfilePhotoSelectorView(), isActive: $viewModel.didAuthenticateUser, label: { })
                
                
                
                AuthenticationHeaderView(title1: "Get started.", title2: "Create your account")
                
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                    CustomInputField(imageName: "person", placeholderText: "Full Name", text: $fullname)
                    CustomInputField(imageName: "lock", placeholderText: "Password",isSecureField: true, text: $password)
                    
                }
                .padding(32)
                
                Button {
                    viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Text("Sign In")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
                
            }
            .ignoresSafeArea()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AuthViewModel()
        
        RegistrationView()
            .environmentObject(viewModel)
            
            
    }
}
