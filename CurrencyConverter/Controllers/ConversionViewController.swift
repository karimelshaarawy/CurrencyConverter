//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 21/08/2023.
//

import UIKit
import DropDown
class ConversionViewController: UIViewController {
    
    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var compareview: UIView!
    @IBOutlet weak var converter: UIView!
    @IBOutlet weak var convertbutton: UIButton!
    @IBOutlet weak var ConvertCompareSwitch: UIView!
    @IBOutlet weak var AmountFromView: UIView!
    @IBOutlet weak var FromView: UIView!
    @IBOutlet weak var ToView: UIView!
    @IBOutlet weak var AmountToView: UIView!
    @IBOutlet weak var ConvertCompareSegment: UISegmentedControl!
    
    @IBOutlet weak var compareamountview: UIView!
    @IBOutlet weak var targetcurrency: UILabel!
    
    
    @IBOutlet weak var AmountView2: UIView!
    @IBOutlet weak var FromAmountview2: UIView!
    @IBOutlet weak var FromToView2: UIView!
    @IBOutlet weak var ToAmountView2: UIView!
    @IBOutlet weak var Convertbutton2: UIButton!
    
    @IBOutlet weak var comparecurrencyview: UIView!
    
    @IBOutlet weak var currencyfrom: UILabel!
    @IBOutlet weak var compareCurrencyFromLabel: UILabel!
    @IBOutlet weak var campareCurrencyToLabel: UILabel!
    @IBOutlet weak var imagecurrencyfrom: UIImageView!
    @IBOutlet weak var currenctto: UILabel!
    @IBOutlet weak var imagecurrencyto: UIImageView!
    
    @IBOutlet weak var comparecurrencytarget2: UILabel!
    
    
    //    var currencies = ["EGP","USD","EUR"]
    //    var rates = ["EGP":["EGP": 1,"USD": 0.033, "EUR": 0.028],
    //                 "USD":["EGP":30,"USD":1,"EUR":0.9],
    //                 "EUR":["EGP":40,"USD":1.1,"EUR":1]
    //    ]
    //   lazy var selectedFrom: String = currencies[0]
    //    lazy var selectedTo: String = currencies[0]
    private var dataSource = ["EGP", "USD", "JPY"]
    var presenter = ConversionPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        convertbutton.layer.cornerRadius = 20
        ConvertCompareSwitch.layer.cornerRadius = 20
        AmountFromView.layer.cornerRadius = 20
        FromView.layer.cornerRadius = 20
        ToView.layer.cornerRadius = 20
        AmountToView.layer.cornerRadius = 20
        ConvertCompareSegment.layer.cornerRadius = 20
        compareamountview.layer.cornerRadius = 20
        
        AmountFromView.layer.borderColor = UIColor.black.cgColor
        AmountFromView.layer.borderWidth = 1
        FromView.layer.borderColor = UIColor.black.cgColor
        FromView.layer.borderWidth = 1
        ToView.layer.borderColor = UIColor.black.cgColor
        ToView.layer.borderWidth = 1
        AmountToView.layer.borderColor = UIColor.black.cgColor
        AmountToView.layer.borderWidth = 1
        compareamountview.layer.borderColor = UIColor.black.cgColor
        compareamountview.layer.borderWidth = 1
        
        AmountView2.layer.cornerRadius = 20
        FromAmountview2.layer.cornerRadius = 20
        FromToView2.layer.cornerRadius = 20
        ToAmountView2.layer.cornerRadius = 20
        Convertbutton2.layer.cornerRadius = 20
        comparecurrencyview.layer.cornerRadius = 20
        
        AmountView2.layer.borderColor = UIColor.black.cgColor
        AmountView2.layer.borderWidth = 1
        FromAmountview2.layer.borderColor = UIColor.black.cgColor
        FromAmountview2.layer.borderWidth = 1
        FromToView2.layer.borderColor = UIColor.black.cgColor
        FromToView2.layer.borderWidth = 1
        ToAmountView2.layer.borderColor = UIColor.black.cgColor
        ToAmountView2.layer.borderWidth = 1
        comparecurrencyview.layer.borderColor = UIColor.black.cgColor
        comparecurrencyview.layer.borderWidth = 1
        presenter.convertCurrency(from: "USD", to: "EGP")
    }
    
    
    @IBAction func sagmentview(_ sender: UISegmentedControl) {
        
        if (sender.selectedSegmentIndex == 0){
            converter.isHidden = false
            compareview.isHidden = true
        } else {
            converter.isHidden = true
            compareview.isHidden = false
        }
    }
    
    @IBAction func buttonConvertCurrencyFrom(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = FromView
        dropDown.dataSource = dataSource
        
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)

        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView?.image = UIImage(named: "\(index)")
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    currencyfrom.text = item
                }
        dropDown.show()
    }
    
    @IBAction func buttonConvertCurrencyTo(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = ToView
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)

        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView?.image = UIImage(named: "\(index)")
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    currenctto.text = item
                }
        dropDown.show()
    }
    
    @IBAction func buttonCompareCurrencyFrom(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = FromAmountview2
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)

        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView?.image = UIImage(named: "\(index)")
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
                    compareCurrencyFromLabel.text = item
                }
        dropDown.show()
    }
    
    @IBAction func buttonCompareCurrencyToFirst(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = FromToView2
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)

        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView?.image = UIImage(named: "\(index)")
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                  print("Selected item: \(item) at index: \(index)")
            comparecurrencytarget2.text = item
                }
        dropDown.show()
    }
    
    @IBAction func buttonCompareCurrencyToSecond(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = FromView
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)

        dropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
           guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView?.image = UIImage(named: "\(index)")
            cell.optionLabel.text = item
        }
        dropDown.show()
    }
    
    
        @IBAction func convertCurrencies(_ sender: Any) {
            guard let amount = amountTextField.text else{ return}
    
            if( amount == ""){
                return
            }
            guard let amount = Double(amount) else {return}
//            if let ratio = rates[selectedFrom]![selectedTo]{
//                resultLabel.text = "\(amount * ratio)"
//            }
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
}
