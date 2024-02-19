//
//  RoundedShape.swift
//  College Market V.2
//
//  Created by Adam Essawi on 12/25/23.
//

import SwiftUI

struct RoundedShape: Shape {
    var corners: UIRectCorner
    //custom modifer that allows us to round out any shape we want.
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 80, height: 80))
        
        return Path(path.cgPath)
    }
    
}
