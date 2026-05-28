//
//  AuthVm.swift
//  Istore
//
//  Created by Apple on 26/05/2026.
//

import SwiftUI

@Observable
class AuthVm{
    var emailLoginState:ValidState = .empty
    var passwordLoginState:ValidState = .empty
    var isLoginDetailsValid:Bool = false
    var nameRegisterState:ValidState = .empty
    var emailRegisterState:ValidState = .empty
    var passwordRegisterState:ValidState = .empty
    var isRegisterDetailsValid:Bool = false
    
    var emailLoginText:String = ""{
        didSet{
            emailLoginState = emailLoginText.isEmpty ? .empty : !emailLoginText
                .contains("@") ? .invalid: .valid
            
            checkIfLoginIsValid()
        }
    }
    var passwordLoginText:String = ""{
        didSet{
            passwordLoginState = passwordLoginText.isEmpty ?
                .empty
            : passwordLoginText.count<6 ?
                .invalid :
                .valid
            checkIfLoginIsValid()
        }
    }
    
    func checkIfLoginIsValid(){
       isLoginDetailsValid = (emailLoginState == .valid && passwordLoginState == .valid)
    }
    
    
    var nameRegisterText:String = ""{
        didSet{
            nameRegisterState = nameRegisterText.isEmpty ?
                .empty :nameRegisterText.count < 4 ?
                .invalid:
                .valid
            
            checkIfRegisterIsValid()
        }
    }
    
    var emailReisterText:String = ""{
        didSet{
            emailRegisterState = emailReisterText.isEmpty ?
                .empty : !emailReisterText
                .contains("@") ?
                .invalid:
                .valid
            checkIfRegisterIsValid()
            
        }
    }
    
    
    var passwordRegisterText:String = ""{
        didSet{
            passwordRegisterState = passwordRegisterText.isEmpty ?
                .empty
            : passwordRegisterText.count<6 ?
                .invalid :
                .valid
            
            checkIfRegisterIsValid()
        }
    }
    
    func checkIfRegisterIsValid(){
        isRegisterDetailsValid = (emailRegisterState == .valid && passwordRegisterState == .valid && nameRegisterState == .valid)
    }
    
    
    
    func login()async throws{
        
        guard let url = URLComponents(string: "\(baseUrl)/auth/login")?.url else{
            throw NetworkError.invalidUrl
        }
        print("url is :\(url)")
        
       let loginRequest = UserLogin(email: emailLoginText, password: passwordLoginText)
    
        let requestBody:Data
        
        do{
            requestBody = try JSONEncoder().encode(loginRequest)
            
        }catch{
            print("Error is \(error)")
            throw NetworkError.invalidData
        }
        
        
        
        
        do{
            let (data,response) = try await HttpClient.shared.httpRequest(
                url: url,method: HttpMethod.POST,body: requestBody)
            as (ValidateResponse, HTTPURLResponse)
            
            print("Data is \(data)")
            
        }catch{
            print("error \(error)")
           throw error
        }
        
        
        
    
    }
   
    
    
    
}
