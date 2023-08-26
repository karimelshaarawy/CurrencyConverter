//
//  ConversionPresenter.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 21/08/2023.
//

import Foundation

protocol ConversionVC{
    func setCountries(countries:[CurrencyList])
    func setDataSource(list:[CurrencyList])
}

class ConversionPresenter{
    
    var view: ConversionVC?
    
    init(view: ConversionVC? = nil) {
        self.view = view
    }
    
    
    func convertCurrency(from: String,to: String){
        APIManager.getCurrencies(from: from) { currencies, error in
            if(error != nil){
                print(error?.localizedDescription ?? "error")
                return
            }
            if let currencies = currencies ,let conversionRates = currencies.conversionRates{
                  print(conversionRates[to] ?? "not found")
            }
            
        }
    }
    func convert(from:String,to:String,amount: Double){
        APIManager.getConversion(from: from, to: to, amount: amount) { conversionRate, error in
            if(error != nil){
                print(error?.localizedDescription ?? "error")
                return
            }
            if let rate = conversionRate {
                print(rate)
            }
        }
    }
    
    func getCountries() {
        var list: [CurrencyList]? = nil
        APIManager.getCountries {[weak self] countriesCurrencies, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "ERROR")
                return
            }
            if let countriesCurrencies = countriesCurrencies {
                list = countriesCurrencies.currencyList
            }
            self!.view!.setCountries(countries: list ?? [])
            self!.view!.setDataSource(list: list ?? [])
        }
       
    }
    
    func returnCurrenciesNamesList(currencies:[CurrencyList])->[String]{
    var list: [String] = []
        for currency in currencies {
            list.append(currency.currencyCode!)
        }
        return list
    }
}
