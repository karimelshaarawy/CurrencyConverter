//
//  Conversion.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 26/08/2023.
//

import Foundation

// MARK: - Conversion
struct Conversion: Codable {
    let conversionResult: Double?

    enum CodingKeys: String, CodingKey {
        case conversionResult = "conversion_result"
    }
}
