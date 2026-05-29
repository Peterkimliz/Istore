//
//  ForgotPassword.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    @Environment(AuthVm.self) private var authVm
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
       @Bindable var authVmBindable=authVm
        
        VStack(spacing: 15){
            
            TextFormField(
                value: $authVmBindable.emailForgetText,
                placeHolder: "Email",
                validState: authVmBindable.emailForgetState,
                image: "envelope.fill"
            )
            
            Button {
                dismiss()
                
            } label: {
               Text("Forget")
                    .buttonTextModifier(bgColor: authVmBindable.emailForgetState == .valid ? Color.black  : .gray.opacity(0.4))
            }.disabled(authVmBindable.emailForgetState == .valid ? false : true)

            
            Spacer()
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
           .navigationTitle("Forgot Password")
           .padding()
    }
}

#Preview {
    ForgotPasswordScreen()
}
