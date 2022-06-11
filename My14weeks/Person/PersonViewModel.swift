//
//  PersonViewModel.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import Foundation

class PersonViewModel {
    
    var person: Observable<Person> = Observable(Person(page: 0, results: [], totalPages: 0, totalResults: 0))
    
    
    func fetchPerson(query: String, page: Int) {
        
        APIService.person(text: query, page: page) { personData, error in
            guard let response = personData else {
                return
            }
            
            self.person.value = response
        }
    }
    
}


extension PersonViewModel {
    
    var numberOfRowInsection: Int {
        return person.value.results.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> Result {
        return person.value.results[indexPath.row]
    }
    
}
