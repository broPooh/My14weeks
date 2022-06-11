//
//  LottoViewModel.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import Foundation

class LottoViewModel {

    var myLotto: Observable<Lotto> = Observable(Lotto(totSellamnt: 0, returnValue: "", drwNoDate: "", firstWinamnt: 1, drwtNo6: 1, drwtNo4: 1, firstPrzwnerCo: 1, drwtNo5: 1, bnusNo: 1, firstAccumamnt: 1, drwNo: 1, drwtNo2: 1, drwtNo3: 1, drwtNo1: 1))
    
    var lotto1 = Observable(1)
    var lotto2 = Observable(23)
    var lotto3 = Observable(3)
    var lotto4 = Observable(4)
    var lotto5 = Observable(5)
    var lotto6 = Observable(6)
    var lotto7 = Observable(7)
    
    
    func fetchLottoAPI(_ number: Int) {
        APIService.lotto(number: number) { lotto, error in
            guard let lotto = lotto else {
                return
            }
            
            //여기서 메인쓰레드로 변경해주는 것이 좋지 않나요.?
            self.myLotto.value = lotto

            self.lotto1.value = lotto.drwtNo1
            self.lotto2.value = lotto.drwtNo2
            self.lotto3.value = lotto.drwtNo3
            self.lotto4.value = lotto.drwtNo4
            self.lotto5.value = lotto.drwtNo5
            self.lotto6.value = lotto.drwtNo6
            self.lotto7.value = lotto.bnusNo
            
        
            
        }
    }
    
    func format(for number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: number)!
        return result
    }
}
