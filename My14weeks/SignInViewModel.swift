//
//  SignInViewModel.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import Foundation

class SignInViewModel {
    
    var username: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    func postUserLogin(completion: @escaping () -> Void) {
        APIService.login(identifier: username.value, password: password.value) { userData, error in
            
            guard let userData = userData else {
                print(error)
                UserDefaults.standard.set("test", forKey: "token")
                return
            }
            
            //로그인시 받아온 데이터를 간단하게 저장
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "nickname")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")
            
            
            completion()
            
        }
    }
}
