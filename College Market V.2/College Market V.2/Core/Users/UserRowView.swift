//
//  UserRowView.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/24/23.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 48, height: 48)
                
            VStack(alignment: .leading, spacing: 4)
            {
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

