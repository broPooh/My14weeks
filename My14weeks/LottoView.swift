//
//  LottoView.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import UIKit
import SnapKit

class LottoView: UIView, ViewRepresentable {
    
    //번호 1~7, 일자, 당첨금액
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let label4 = UILabel()
    let label5 = UILabel()
    let label6 = UILabel()
    let label7 = UILabel()
    
    let dateLabel = UILabel()
    let moneyLable = UILabel()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.backgroundColor = .white
        view.distribution = .fillEqually
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(stackView)

        [label1, label2, label3, label4, label5, label6, label7].forEach {
            $0.backgroundColor = .lightGray
            stackView.addArrangedSubview($0)
        }
        addSubview(dateLabel)
        addSubview(moneyLable)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
            $0.center.equalToSuperview()
        }
        
        dateLabel.backgroundColor = .white
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        moneyLable.backgroundColor = .white
        moneyLable.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
}
