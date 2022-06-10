//
//  Observable.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import Foundation

class Observable<T> {
    private var listener: ( (T) -> Void )?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ clouser: @escaping (T) -> Void) {
        clouser(value)
        listener = clouser
    }
}
