//
//  ContentView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/23/23.
//

import SwiftUI
import Kingfisher
struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    //can use in all enviroments of views
    
    var body: some View {
        
        
        
        Group {
            
            if (viewModel.userSession == nil)
            {
                LoginView()
            }
            
            else  {
                
                NavigationView {
                    ZStack(alignment: .topLeading){
                        
                        MainTabView()
                            
                        
                            .navigationBarHidden(showMenu)
                        if showMenu {
                            ZStack {
                                Color(.black)
                                    .opacity(showMenu ? 0.25 : 0.0)
                            }.onTapGesture {
                                withAnimation(.easeInOut){
                                    showMenu = false
                                }
                            }
                            .ignoresSafeArea()
                            //shows shadowview stretches top bottom of screen
                        }
                        SideMenuView()
                            .frame(width: 300)
                            .background(showMenu ? Color.white : Color.clear)
                        //colorwhite covers everything else on the screen, good for side view.
                            .offset(x: showMenu ? 0: -300, y:0)
                        
                    }
                
                    //.navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                           if let user = viewModel.currentUser
                            
                            
                                
                            
                            
                            
                             {
                            Button {
                                withAnimation(.easeInOut) {
                                    showMenu.toggle()
                                }
                                } label: {
                                    Circle()
                                    
                                   // KFImage(URL(string: user.profileImageUrl))
                                        //.resizable()
                                        //.scaledToFill()
                                        .frame(width: 32, height: 32)
                                       // .clipShape(Circle())
                                }
                            }
                        }
                    }
                    .onAppear {
                        showMenu = false
                    }
                }
            }
            
        }
        
    }
                }

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
                .environmentObject(AuthViewModel())
        
    }
        
}
