//
//  TextFormField.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

struct TextFormField: View{
    @Binding var value:String
    var placeHolder:String
    var isSecure:Bool=false
    var validState:ValidState
    var image:String
    
    var body: some View{
        
        let shadowColor:Color={
            switch validState {
            case .valid:
                   return .green
            case .invalid:
                return .red
            case .empty:
                return .gray.opacity(0.4)
            }
        }()
        
        HStack{
            
            Image(systemName: image)
              .foregroundStyle(shadowColor)
              .padding(.horizontal,8)
            
            Group{
                
                if isSecure{
                    SecureField(placeHolder,text: $value)

                }else{
                    TextField(placeHolder,text: $value)
                }
                
            }.textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .font(.system(size: 14,design: .monospaced))
        
            
        }.frame(minWidth: 0,maxWidth: .infinity)
            .padding(.vertical,15)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(shadowColor,lineWidth: 1)
                    .shadow(color:.gray,radius: 1)
            )
        
        
        
        
    }
}


#Preview{
    VStack(spacing: 20){
        
        TextFormField(
            value: .constant(""),
            placeHolder: "Email",
            validState: .valid,
            image: "envelope.fill"
        )
        TextFormField(
            value: .constant(""),
            placeHolder: "Password",
            isSecure: true,
            validState: .invalid,
            image: "lock.fill"
        )
        
    }.padding(.horizontal,20)
    
}
