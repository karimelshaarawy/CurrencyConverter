//
//  ConversionPresenter.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 21/08/2023.
//

import Foundation

class ConversionPresenter{
    
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
}
