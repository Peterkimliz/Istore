//
//  Utils.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI


enum ValidState{
    case valid
    case invalid
    case empty
}


extension View{
    
    func buttonTextModifier( bgColor:Color = .black)-> some View{
        self.modifier(ButtonTextModifier(bgColor: bgColor))
    }
    
    
}
//extension EnvironmentValues{
//    @Entry var authVM:AuthVm=AuthVm()
//}

struct ButtonTextModifier:ViewModifier{
    var bgColor:Color

    func body(content: Content) -> some View {
        content
            .frame(minWidth: 0,maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundStyle(.white)
            .font(.system(size: 20,weight:.bold))
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
}

//let baseUrl = "http://localhost:8080/api/V1"
let baseUrl = "https://safaricom.co.ke/api/V1"
