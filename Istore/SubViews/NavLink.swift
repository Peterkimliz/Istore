//
//  NavLink.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

struct NavLink: View {
    var title:String
    var subtitle:String
    var alignment:Alignment = .trailing
    
    var body: some View {
        
        
        HStack(spacing: 3){
            Text(title)
                .font(.system(size: 16))
            
            Text(subtitle)
                .font(.system(size: 16,weight: .bold))
            
        }.frame(maxWidth: .infinity,alignment: alignment)
            .foregroundStyle(.black)
        
    }
}

#Preview {
    NavLink(title: "Forgot", subtitle: "Password?")
}
