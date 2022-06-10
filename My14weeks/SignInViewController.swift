//
//  ViewController.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import UIKit

class SignInViewController: UIViewController {
    
    let mainView = SignInView()
    
    
    let viewModel = SignInViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        bindViewModel()
        
        mainView.signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
    }
    
    func bindViewModel() {
        viewModel.username.bind { username in
            self.mainView.usernameTextField.text = username
        }
        viewModel.password.bind { password in
            self.mainView.passwordTextField.text = password
        }
        
        mainView.usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func usernameTextFieldDidChange(_ textfield: UITextField) {
        viewModel.username.value = textfield.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField) {
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func signInButtonClicked() {
        viewModel.postUserLogin {
            //뷰 컨트롤러의 변경은 메인쓰레드에서 해야한다.
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }

}

