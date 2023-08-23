//
//  APIManager.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 23/08/2023.
//

import Foundation
import Alamofire

class APIManager{
    public static func getCurrencies(from base: String, completion: @escaping (_ currencies: Currencies?,_ error: Error? )-> Void){
        let url = "https://v6.exchangerate-api.com/v6/ecf10bab01b34bf0de9636e1/latest/\(base)"
        AF.request(url,method: .get,parameters: nil,encoding: URLEncoding.default).response { response in
            guard response.error == nil else{
                completion(nil, response.error!)
                return
            }
            
            guard let data = response.data else{
                print("Couldn't get data from API")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let currencies = try decoder.decode(Currencies.self, from: data)
                completion(currencies,nil)

            }catch let error{
                print(error)
                completion(nil,error)
            }
        }
        
        
    }
}