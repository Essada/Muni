//
//  ExploreView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText )
                    .padding()
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.searchbleUsers) { user in
                            
                            NavigationLink {
                               ProfileView(user: user)
                                
                            }
                        label: {
                            UserRowView(user: user)
                                
                        }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
       }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
