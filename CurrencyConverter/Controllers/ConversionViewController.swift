//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 21/08/2023.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
//    var currencies = ["EGP","USD","EUR"]
//    var rates = ["EGP":["EGP": 1,"USD": 0.033, "EUR": 0.028],
//                 "USD":["EGP":30,"USD":1,"EUR":0.9],
//                 "EUR":["EGP":40,"USD":1.1,"EUR":1]
//    ]
//   lazy var selectedFrom: String = currencies[0]
//    lazy var selectedTo: String = currencies[0]
    
    var presenter = ConversionPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
//        fromPicker.delegate = self
//        fromPicker.dataSource = self
//        toPicker.dataSource = self
//        toPicker.delegate = self
        // Do any additional setup after loading the view.
//        amountTextField.keyboardType = .decimalPad
        presenter.convertCurrency(from: "USD", to: "EGP")
    }

//    @IBAction func convertCurrencies(_ sender: Any) {
//        guard let amount = amountTextField.text else{ return}
//
//        if( amount == ""){
//            return
//        }
//        guard let amount = Double(amount)else{return}
//        if let ratio = rates[selectedFrom]![selectedTo]{
//            resultLabel.text = "\(amount * ratio)"
//        }
//
//
//    }
}

//extension ConversionViewController: UIPickerViewDelegate,UIPickerViewDataSource{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return currencies.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return currencies[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == fromPicker{
//            selectedFrom = currencies[row]
//        }else{
//            selectedTo = currencies[row]
//        }
//    }
//}

