//
//  favouritesPresenter.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 25/08/2023.
//

import Foundation

protocol FavouritesVC{
    func reloadTableView()
    func setCountries(countriesList:[CountryList]?)
}
class favouritesPresenter{
    
    var view: FavouritesVC?
    init(view: FavouritesVC? = nil) {
        self.view = view
    }
    
    func getCountries() {
        var list: [CountryList]? = nil
        APIManager.getCountries {[weak self] countriesCurrencies, error in
            guard error == nil else{
                print(error?.localizedDescription ?? "ERROR")
                return
            }
            if let countriesCurrencies = countriesCurrencies {
                list = countriesCurrencies.countryList
                }
            self!.view!.setCountries(countriesList: list)
            self!.view!.reloadTableView()
            }
       
    }
    }

