//
//  RegisterScreen.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

struct RegisterScreen: View {
    @Environment(AuthVm.self) private var authVm
    
    var body: some View {
        @Bindable var authVmBindable = authVm
        
        VStack(spacing: 25){
            
            
            TextFormField(
                value: $authVmBindable.nameRegisterText,
                placeHolder: "Name",
                validState: authVmBindable.nameRegisterState,
                image: "person.fill"
            )
            
            TextFormField(
                value: $authVmBindable.emailReisterText,
                placeHolder: "Email",
                validState: authVmBindable.emailRegisterState,
                image: "envelope.fill"
            )
             
            TextFormField(
                value: $authVmBindable.passwordRegisterText,
                placeHolder: "Password",
                isSecure: true,
                validState: authVmBindable.passwordRegisterState,
                image: "lock.fill"
            )
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .buttonTextModifier(bgColor: authVmBindable.isRegisterDetailsValid ? .black : .gray.opacity(0.4))
            }.disabled(authVmBindable.isRegisterDetailsValid ? false : true)

            NavigationLink {
                LoginScreen()
            } label: {
                NavLink(
                    title: "Already have an account?",
                    subtitle: " Sign In",
                    alignment: .trailing
                )
            }
     
            
            Spacer()
            
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding()
        .navigationTitle("Sign Up")
    
    }
}

#Preview {
    NavigationStack{
        RegisterScreen()
    }
}
