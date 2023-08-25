// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countriesCurrencies = try? JSONDecoder().decode(CountriesCurrencies.self, from: jsonData)

import Foundation

// MARK: - CountriesCurrencies
struct CountriesCurrencies: Codable {
    let countryList: [CountryList]?

    enum CodingKeys: String, CodingKey {
        case countryList = "country_list"
    }
}

// MARK: - CountryList
struct CountryList: Codable {
    let id: Int?
    let countryNameCode, currency: String?
    let countryFlag: String?
}
