//
//  LoginScreen.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(AuthVm.self) private var authVm

    
    var body: some View {
        @Bindable var authVmBindable = authVm
        
        VStack(spacing:20){
            
            TextFormField(
                value: $authVmBindable.emailLoginText,
                placeHolder: "Email",
                validState: authVmBindable.emailLoginState,
                image: "envelope.fill")
            
            TextFormField(
                value: $authVmBindable.passwordLoginText,
                placeHolder: "Password",
                isSecure: true,
                validState: authVmBindable.passwordLoginState,
                image: "lock.fill")
            
        
            NavigationLink(destination: {
                ForgotPasswordScreen()
            }){
                NavLink(title: "", subtitle: "Forgot Password?")
            }
            
            
            Button {
                Task{
                   try await authVmBindable.login()
                }
            } label: {
                Text("Sign In")
                    .buttonTextModifier(bgColor: authVmBindable.isLoginDetailsValid ? .black : .gray.opacity(0.4))
            }.disabled(authVmBindable.isLoginDetailsValid ? false : true)

            
            Spacer()
            
            NavigationLink(destination: {
                RegisterScreen()
            }){
                NavLink(title: "Dont have an account?", subtitle: "Sign Up",alignment: .center)
            }
            
            
        }.padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .navigationTitle("Sign In")
        .navigationBarBackButtonHidden()
        
    }
}

//#Preview {
//    
//    struct LoginScreenWrapper : View{
//        @State  var authVm = AuthVm()
//    
//        var body: some View{
//          LoginScreen()
//                .environment(authVm)
//            
//        }
//        
//    }
//    
//    
//    return LoginScreenWrapper()
//  
//}
