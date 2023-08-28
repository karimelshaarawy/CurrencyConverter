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
    func setConvertTextField(rate:Double)
    func setCompareToFields(results:[Double])
    func setPortoflioCurrencies(list:[CurrencyList])
    func setPortofolioValues(list: [Double])
    func reloadPortofolioTable()
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
        APIManager.getConversion(from: from, to: to, amount: amount) { [weak self] conversionRate, error in
            if(error != nil){
                print(error?.localizedDescription ?? "error")
                return
            }
            if let rate = conversionRate {
                self!.view?.setConvertTextField(rate: rate)
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
    func compareTwo(baseID:Int,targetIDs:[Int],amount:Double){
        APIManager.getComparison(from: baseID, to: targetIDs, amount: amount) {[weak self] compareList, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "ERROR")
                return
            }
            if let compare = compareList{
                self!.view?.setCompareToFields(results: compare)
            }
        }
    }
    
    func getProtofolio(baseId:Int){
        if let savedData = UserDefaults.standard.object(forKey: "favourites") as? Data {
            let decoder = JSONDecoder()
            if var loadedItems = try? decoder.decode([CurrencyList].self, from: savedData) {
                view?.setPortoflioCurrencies(list: loadedItems)
                var ids = returnCurrenciesIDList(currencies: loadedItems)
                APIManager.getComparison(from: baseId, to: ids, amount: 1) { [weak self]compareList, error in
                    guard error == nil else{
                        print(error?.localizedDescription)
                        return
                    }
                    if let compare = compareList{
                        self!.view?.setPortofolioValues(list: compare)
                        self!.view?.reloadPortofolioTable()
                    }
                    
                }
               
            }
        }
    }
    
    func returnCurrenciesIDList(currencies:[CurrencyList])->[Int]{
    var list: [Int] = []
        for currency in currencies {
            list.append(currency.id!)
        }
        return list
    }
    
    
}
