//
//  HttpClient.swift
//  Istore
//
//  Created by Apple on 27/05/2026.
//
import SwiftUI

enum HttpMethod:String{
    case GET="GET"
    case POST="POST"
    case PATCH="PATCH"
    case DELETE="DELETE"
    case PUT="PUT"
}


enum NetworkError:Error{
    case invalidUrl
    case invalidResponse
    case invalidHttpStatusCode
    case invalidData
}


class HttpClient{
    
    static let shared:HttpClient = HttpClient()
    
    
    let configuration:URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpCookieStorage = HTTPCookieStorage.shared
        
        return config
    }()
    
    
    let session:URLSession
    
    
    init() {
        self.session = URLSession(configuration: configuration)
    }
    
    
    func httpRequest<T:Decodable>(
        url:URL ,
        method:HttpMethod,
        body:Data?=nil,
        headers:[String:String]?=nil
    ) async throws->(data:T,response:HTTPURLResponse){
        
      var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        if let headers = headers{
            for (key, value) in headers{
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        do{
            let (data, response) = try await session.data(for: request)
            
            print("url is:   \(url)")
            print("method is:  \(method)")
            guard let response = response as? HTTPURLResponse else{
                throw NetworkError.invalidHttpStatusCode
            }
            
            let responseData = try JSONDecoder().decode(T.self, from: data)
            return (responseData,response)
            
        }catch{
            print("error is \(error)")
            throw error
        }
        
    }
    
}
