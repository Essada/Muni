//
//  MainTabView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        //selected index so we can
        //keep track of what tab a user
        //is on
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                    
                }
                .tabItem {
                    Image(systemName: "house")
                    
                }
                .tag(0)
            
        }
    }
}
           /*
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "house")
                    
                }
                .tag(1)
            
            
            
            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "house")
                    
                }
                .tag(2)
            
            
            
            NotificationsView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "house")
                    
                }
            .tag(3)
            
        }
    }
}

/*
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
 */*/
