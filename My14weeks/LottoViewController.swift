//
//  LottoViewController.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//
import UIKit
import SnapKit

class LottoViewController: UIViewController {
        
    let lottoView = LottoView()
    
    let lottoViewModel = LottoViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = lottoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //bindLotto()
        
        lottoViewModel.myLotto.bind({ lotto in
            self.lottoView.label1.text = "\(lotto.drwtNo1)"
            self.lottoView.label2.text = "\(lotto.drwtNo2)"
            self.lottoView.label3.text = "\(lotto.drwtNo3)"
            self.lottoView.label4.text = "\(lotto.drwtNo4)"
            self.lottoView.label5.text = "\(lotto.drwtNo5)"
            self.lottoView.label6.text = "\(lotto.drwtNo6)"
            self.lottoView.label7.text = "\(lotto.bnusNo)"
            
            self.lottoView.dateLabel.text = lotto.drwNoDate
            self.lottoView.moneyLable.text = self.lottoViewModel.format(for: lotto.firstWinamnt)
        })
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.lottoViewModel.fetchLottoAPI(678)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
            self.lottoViewModel.fetchLottoAPI(900)
        }
    }
    
    func bindLotto() {
        lottoViewModel.lotto1.bind { number in
            self.lottoView.label1.text = "\(number)"
        }
        lottoViewModel.lotto2.bind { number in
            self.lottoView.label2.text = "\(number)"
        }
        lottoViewModel.lotto3.bind { number in
            self.lottoView.label3.text = "\(number)"
        }
        lottoViewModel.lotto4.bind { number in
            self.lottoView.label4.text = "\(number)"
        }
        lottoViewModel.lotto5.bind { number in
            self.lottoView.label5.text = "\(number)"
        }
        lottoViewModel.lotto6.bind { number in
            self.lottoView.label1.text = "\(number)"
        }
        lottoViewModel.lotto6.bind { number in
            self.lottoView.label1.text = "\(number)"
        }
        lottoViewModel.lotto7.bind { number in
            self.lottoView.label7.text = "\(number)"
        }
    }
    
}
