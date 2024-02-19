//
//  LoginView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/25/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewmodel: AuthViewModel
    var body: some View {
        NavigationView{
            VStack {
                //HSTACk spacer means we can spread things out to both sides of the screen
                AuthenticationHeaderView(title1: "Hello.", title2: "Welcome Back")
                
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                    CustomInputField(imageName: "lock", placeholderText: "Password",isSecureField: true, text: $password)
                    
                }
                .padding(.horizontal, 32)
                .padding(.top, 44)
                
                HStack {
                    Spacer()
                    
                    NavigationLink {
                        Text("Reset password view..")
                    } label: {
                        Text("Forgot password?")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                            .padding(.top)
                            .padding(.trailing, 24)
                    }
                }
                
                
                Button {
                    viewmodel.login(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                
                
                
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarHidden(true)
                }
            label: {
                HStack {
                    Text("Dont have an account?")
                        .font(.footnote)
                    
                    Text("sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color(.systemBlue))
                
            }
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
