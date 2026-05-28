//
//  IstoreApp.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

@main
struct IstoreApp: App {
    @State private var authVm:AuthVm=AuthVm()
    var body: some Scene {
        WindowGroup {
            
            NavigationStack{
                LoginScreen()
            }
        }.environment(authVm)
    }
}
