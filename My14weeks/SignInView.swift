//
//  SignInView.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import UIKit
import SnapKit


protocol ViewRepresentable {
    func setupView()
    func setupConstraints()
}


class SignInView: UIView, ViewRepresentable {

     
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(usernameTextField)
        usernameTextField.backgroundColor = .white
        addSubview(passwordTextField)
        passwordTextField.backgroundColor = .white
        addSubview(signInButton)
        signInButton.backgroundColor = .systemBlue
    }
    
    func setupConstraints() {
        usernameTextField.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(self.snp.width).multipliedBy(0.9)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(self.snp.width).multipliedBy(0.9)
            $0.height.equalTo(50)
        }
        
        signInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.width.equalTo(self.snp.width).multipliedBy(0.9)
            $0.height.equalTo(50)
        }
        
        
    }
    

}
