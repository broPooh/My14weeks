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

    
    static func lotto(number: Int, completion: @escaping (Lotto?, APIError?) -> Void ) {
        let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)")!
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
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
                    let lotto = try decoder.decode(Lotto.self, from: data)
                    
                    completion(lotto, nil)
                } catch {
                    print("실패")
                    completion(nil, .invalidData)
                }
            }
            
        }.resume()
        
    }
    
    static func person(text: String, page: Int, completion: @escaping (Person?, APIError?) -> Void ) {
        
        //"https://api.themoviedb.org/3/search/person?api_key=26f86956890fd5c2c8e65d242960dc30&language=en"
        //https://api.themoviedb.org/3/search/person?api_key=26f86956890fd5c2c8e65d242960dc30&language=en-US&page=1&include_adult=false

        
        let scheme = "https"
        let host = "api.themoviedb.org"
        let path = "/3/search/person"
        
        let key = "26f86956890fd5c2c8e65d242960dc30"
        let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let language = "ko-KR"
        
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
            URLQueryItem(name: "api_key", value: key),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "language", value: language)
        ]
               
        
        URLSession.shared.dataTask(with: component.url!) { data, response, error in
            
            DispatchQueue.main.async {
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
                    let personData = try decoder.decode(Person.self, from: data)
                    
                    completion(personData, nil)
                } catch {
                    print("실패")
                    completion(nil, .invalidData)
                }
            }
            
        }.resume()
        
    }
}

