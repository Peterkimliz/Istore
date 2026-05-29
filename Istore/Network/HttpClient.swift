//
//  HttpClient.swift
//  Istore
//
//  Created by Apple on 27/05/2026.
//
import SwiftUI

enum HttpMethod: String {
    case GET = "GET"
    case POST="POST"
    case PUT="PUT"
    case DELETE="DELETE"
    case PATCH="PATCH"
}


enum NetworkErrors:Error{
    case invalidUrl
    case inavlidData
    case invalidResponse
    case invalidResponseStatusCode
}


class HttpClient{
    
    static var shared:HttpClient = HttpClient()
    
    
    let configuration:URLSessionConfiguration={
        let config = URLSessionConfiguration.default
    
        config.httpCookieStorage=HTTPCookieStorage.shared
        return config
        
    }()
    
    
    let session:URLSession
    
    init() {
        self.session = URLSession(configuration: configuration)
    }
    
    
    func httpRequest<T:Decodable>(
        url:URL,
        method:HttpMethod,
        body:Data?=nil,
        headers:[String:String]?=nil
    )async throws->(data:T, response:HTTPURLResponse){
        
      var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let headers = headers{
            for (key,value ) in headers{
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        
        do{
            let (data ,response) = try await session.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                throw NetworkErrors.invalidResponseStatusCode
            }
            
            let responseData = try JSONDecoder().decode(T.self, from: data)
            return (responseData,response)
            
        }catch{
            throw error
        }
    
        
        
    }
    
    
    
    
}
