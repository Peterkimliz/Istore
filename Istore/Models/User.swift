//
//  User.swift
//  Istore
//
//  Created by Apple on 27/05/2026.
//

import SwiftUI


struct UserLogin:Codable{
    let email:String
    let password:String
    
}


struct ValidateResponse:Decodable{
    let email:String
}
