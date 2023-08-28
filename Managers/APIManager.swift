//
//  APIManager.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 23/08/2023.
//

import Foundation
import Alamofire
import NVActivityIndicatorViewExtended

class APIManager{
    static let activityData = ActivityData()

    public static func getCurrencies(from base: String, completion: @escaping (_ currencies: Currencies?,_ error: Error? )-> Void){
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)

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

            } catch let error{
                print(error)
                completion(nil,error)
            }
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
        
    }
    
    public static func getCountries(completion: @escaping (_ countriesCurrencies: CountriesCurrencies?,_ error: Error? )-> Void){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)

        let url = "http://ec2-18-134-206-213.eu-west-2.compute.amazonaws.com/api/v1/currency"
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
                let currencies = try decoder.decode(CountriesCurrencies.self, from: data)
                completion(currencies,nil)

            }catch let error{
                print(error)
                completion(nil,error)
            }
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
        
        
    }
    
    public static func getConversion(from base: String,to target: String,amount: Double, completion: @escaping (_ conversionRate: Double?,_ error: Error? )-> Void){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)

        let url = "http://ec2-18-134-206-213.eu-west-2.compute.amazonaws.com/api/v1/currency/convert/\(base)/\(target)/\(Int(amount))"
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
                let currencies = try decoder.decode(Conversion.self, from: data)
                completion(currencies.conversionResult,nil)

            }catch let error{
                print(error)
                completion(nil,error)
            }
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()

        }
        
        
    }
    
    public static func getComparison(from baseID: Int,to targetIDs: [Int],amount: Double, completion: @escaping (_ compareList: [Double]?,_ error: Error? )-> Void){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)

           let url = "http://ec2-18-134-206-213.eu-west-2.compute.amazonaws.com/api/v1/currency/compare"
           let parameters: [String:Any] = [
               "baseCurrencyId": baseID,
               "targetCurrencyIds": targetIDs,
               "amount": amount
           ]
           AF.request(url,method: .post,parameters: parameters,encoding: JSONEncoding.default).response { response in
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
                   let currencies = try decoder.decode(Comparison.self, from: data)
                   completion(currencies.compareResult,nil)

               }catch let error{
                   print(error)
                   completion(nil,error)
               }
               NVActivityIndicatorPresenter.sharedInstance.stopAnimating()

           }
           
           
       }
    
    
}
