import Foundation

// MARK: - CountriesCurrencies
struct CountriesCurrencies: Codable {
    let currencyList: [CurrencyList]?

    enum CodingKeys: String, CodingKey {
        case currencyList = "currency_list"
    }
}

// MARK: - CurrencyList
struct CurrencyList: Codable {
    let id: Int?
    let currencyCode: String?
    let flagURL: String?

    enum CodingKeys: String, CodingKey {
        case id, currencyCode
        case flagURL = "flagUrl"
    }
}
