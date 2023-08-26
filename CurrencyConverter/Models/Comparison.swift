//
//  Comparison.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 27/08/2023.
//
import Foundation

// MARK: - Comparison
struct Comparison: Codable {
    let compareResult: [Double]?

    enum CodingKeys: String, CodingKey {
        case compareResult = "compare_result"
    }
}
