//
//  APIService.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
}

class APIService {
    
    static func login(identifier: String, password: String, completion: @escaping (User?, APIError?) -> Void ) {
        let url = URL(string: "http://test.monocoding.com/auth/local")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //String -> date, dictionary -> JSONSerialization / Codable
        request.httpBody = "identifier=\(identifier)&password=\(password)".data(using: .utf8, allowLossyConversion: false)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(nil, .failed)
                return
            }
            
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard response.statusCode == 200 else {
                completion(nil, .failed)
                return
            }
            
            do {
                //받아온 데이터를 코더블로 디코드
                let decoder = JSONDecoder()
                let userData = try decoder.decode(User.self, from: data)
                
                completion(userData, nil)
            } catch {
                print("실패")
                completion(nil, .invalidData)
            }
            
        }.resume()
        
    }
    
}

