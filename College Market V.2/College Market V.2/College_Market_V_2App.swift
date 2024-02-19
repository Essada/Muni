//
//  College_Market_V_2App.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/23/23.
//

import SwiftUI
import Firebase

@main
struct College_Market_V_2App: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
       FirebaseApp.configure()
    }
    
    var body: some Scene {
        //WindowGroup {
        
        WindowGroup{
            //  NavigationView {
            
            //ContentView()
            //ContentView()
            
            ContentView()
                .environmentObject(viewModel)
            
            
        }
                
            }
            
            // }
        
    }
    // }

