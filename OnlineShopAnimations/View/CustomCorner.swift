//
//  CustomCorner.swift
//  OnlineShopAnimations
//
//  Created by Maxim Macari on 06/10/2020.
//

import SwiftUI

struct CustomCorner: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
        
    }
}
