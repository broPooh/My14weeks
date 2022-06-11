//
//  Person.swift
//  My14weeks
//
//  Created by bro on 2022/06/10.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let knownForDepartment, name: String
    
    enum CodingKeys: String, CodingKey {
    
        case knownForDepartment = "known_for_department"
        case name
    }
}
