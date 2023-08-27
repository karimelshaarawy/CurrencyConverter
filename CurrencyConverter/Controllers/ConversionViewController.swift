//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 21/08/2023.
//

import UIKit
import DropDown
import Kingfisher
class ConversionViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var segmentView: UIView!
    
    @IBOutlet weak var convertContainerView: UIView!
    @IBOutlet weak var compareContainerView: UIView!
    // ConvertView Outlets
    @IBOutlet weak var convertFromView: UIView!
    @IBOutlet weak var convertFromTextField: UITextField!
    @IBOutlet weak var convertFromCurrencyView: UIView!
    @IBOutlet weak var convertToCurrencyView: UIView!
    @IBOutlet weak var convertFromImageView: UIImageView!
    @IBOutlet weak var convertFromCurrencyLabel: UILabel!
    
    @IBOutlet weak var convertToImageView: UIImageView!
    @IBOutlet weak var convertToCurrencyLabel: UILabel!
    @IBOutlet weak var convertAmountView: UIView!
    @IBOutlet weak var convertResultLabel: UILabel!
    
    // CompareView Outlets
    @IBOutlet weak var compareFromView: UIView!
    @IBOutlet weak var compareFromTextField: UITextField!
    @IBOutlet weak var compareFromCurrencyView: UIView!
    @IBOutlet weak var compareToCurrencyView: UIView!
    @IBOutlet weak var compareFromImageView: UIImageView!
    @IBOutlet weak var compareFromCurrencyLabel: UILabel!
    
    @IBOutlet weak var compareToCurrencySecondView: UIView!
    @IBOutlet weak var compareFromImageSecondView: UIImageView!
    @IBOutlet weak var compareFromCurrencySecondLabel: UILabel!
    
    @IBOutlet weak var compareToImageView: UIImageView!
    @IBOutlet weak var compareToCurrencyLabel: UILabel!
    @IBOutlet weak var compareAmountView: UIView!
    @IBOutlet weak var compareResultLabel: UILabel!
    @IBOutlet weak var compareAmountSecondView: UIView!
    @IBOutlet weak var compareResultSecondLabel: UILabel!
    
    
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var compareButton: UIButton!
    
    lazy var presenter = ConversionPresenter(view: self)
       var countries:[CurrencyList] = []
       private var dataSource:[String] = []
    var selectedConvertFrom = "USD"
    var selectedConvertTo = "USD"
    var selectedCompareFrom = "USD"
    var selectedCompareTo1 = "USD"
    var selectedCompareTo2 = "USD"

    override func viewDidLoad() {
        super.viewDidLoad()
        convertButton.layer.cornerRadius = 20
        compareButton.layer.cornerRadius = 20
        segmentControl.layer.cornerRadius = 20
        segmentControl.clipsToBounds = true

        segmentView.layer.cornerRadius = 10
        convertContainerView.layer.cornerRadius = 20
        compareContainerView.layer.cornerRadius = 20
        convertFromView.layer.cornerRadius = 20
        convertFromCurrencyView.layer.cornerRadius = 20
        convertToCurrencyView.layer.cornerRadius = 20
        convertAmountView.layer.cornerRadius = 20
        convertFromTextField.layer.cornerRadius = 20
        
        compareFromView.layer.cornerRadius = 20
        compareFromCurrencyView.layer.cornerRadius = 20
        compareToCurrencyView.layer.cornerRadius = 20
        compareToCurrencySecondView.layer.cornerRadius = 20
        compareAmountView.layer.cornerRadius = 20
        compareAmountSecondView.layer.cornerRadius = 20
        
        convertFromTextField.layer.cornerRadius = 20
        convertFromTextField.clipsToBounds = true
        
        compareFromTextField.layer.cornerRadius = 20
        compareFromTextField.clipsToBounds = true
        
        convertFromView.layer.borderColor = UIColor.black.cgColor
        convertFromView.layer.borderWidth = 1
        convertFromCurrencyView.layer.borderColor = UIColor.black.cgColor
        convertFromCurrencyView.layer.borderWidth = 1
        convertToCurrencyView.layer.borderColor = UIColor.black.cgColor
        convertToCurrencyView.layer.borderWidth = 1
        convertAmountView.layer.borderColor = UIColor.black.cgColor
        convertAmountView.layer.borderWidth = 1
        
        compareFromView.layer.borderColor = UIColor.black.cgColor
        compareFromView.layer.borderWidth = 1
        compareFromCurrencyView.layer.borderColor = UIColor.black.cgColor
        compareFromCurrencyView.layer.borderWidth = 1
        compareToCurrencyView.layer.borderColor = UIColor.black.cgColor
        compareToCurrencyView.layer.borderWidth = 1
        compareToCurrencySecondView.layer.borderColor = UIColor.black.cgColor
        compareToCurrencySecondView.layer.borderWidth = 1
        compareAmountView.layer.borderColor = UIColor.black.cgColor
        compareAmountView.layer.borderWidth = 1
        compareAmountSecondView.layer.borderColor = UIColor.black.cgColor
        compareAmountSecondView.layer.borderWidth = 1
        presenter.convertCurrency(from: "USD", to: "EGP")
        
        convertContainerView.isHidden = false
        compareContainerView.isHidden = true
        
        presenter.getCountries()

    }
    
    
    @IBAction func sagmentview(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            convertContainerView.isHidden = false
            compareContainerView.isHidden = true
        } else {
            compareContainerView.isHidden = false
            convertContainerView.isHidden = true
        }
    }
    
    @IBAction func buttonConvertCurrencyFrom(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = convertFromCurrencyView
        dropDown.dataSource = dataSource
        dropDown.cellHeight = 30
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)
        
        
        dropDown.customCellConfiguration = {[weak self] (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView!.kf.setImage(with: URL(string:self!.countries[index].flagURL!))
            cell.imageView?.image?.sd_resizedImage(with: CGSize(width: 28, height: 20), scaleMode: .aspectFit)
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            convertFromCurrencyLabel.text = item
            convertFromImageView.kf.setImage(with: URL(string:self.countries[index].flagURL!))
            selectedConvertFrom = item
        }
        dropDown.show()
    }
    
    @IBAction func buttonConvertCurrencyTo(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = convertToCurrencyView
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)
        dropDown.cellHeight = 30

        
        dropDown.customCellConfiguration = {[weak self] (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView!.kf.setImage(with: URL(string:self!.countries[index].flagURL!))
            cell.imageView?.image?.sd_resizedImage(with: CGSize(width: 28, height: 20), scaleMode: .aspectFit)
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            convertToCurrencyLabel.text = item
            convertToImageView.kf.setImage(with: URL(string:self.countries[index].flagURL!))
            selectedConvertTo = item
        }
        dropDown.show()
    }
    
    @IBAction func buttonCompareCurrencyFrom(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = compareFromCurrencyView
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)
        dropDown.cellHeight = 30

        
        dropDown.customCellConfiguration = {[weak self] (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView!.kf.setImage(with: URL(string:self!.countries[index].flagURL!))
            cell.imageView?.image?.sd_resizedImage(with: CGSize(width: 28, height: 20), scaleMode: .aspectFit)
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            compareFromCurrencyLabel.text = item
        }
        dropDown.show()
    }
    
    @IBAction func buttonCompareCurrencyToFirst(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = compareToCurrencyView
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)
        dropDown.cellHeight = 30

        
        dropDown.customCellConfiguration = {[weak self] (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView!.kf.setImage(with: URL(string:self!.countries[index].flagURL!))
            cell.imageView?.image?.sd_resizedImage(with: CGSize(width: 28, height: 20), scaleMode: .aspectFit)
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            compareToCurrencyLabel.text = item
        }
        dropDown.show()
    }
    
    @IBAction func buttonCompareCurrencyToSecond(_ sender: Any) {
        let dropDown = DropDown()
        dropDown.anchorView = compareToCurrencySecondView
        dropDown.dataSource = dataSource
        dropDown.cellNib = UINib(nibName: "CustomDropDownCell", bundle: nil)
        dropDown.cellHeight = 30

        
        dropDown.customCellConfiguration = {[weak self] (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CustomDropDownCell else { return }
            cell.imageView!.kf.setImage(with: URL(string:self!.countries[index].flagURL!))
            cell.imageView?.image?.sd_resizedImage(with: CGSize(width: 28, height: 20), scaleMode: .aspectFit)
            cell.optionLabel.text = item
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            compareFromCurrencySecondLabel.text = item
        }
        dropDown.show()
    }
    
    
    @IBAction func convertCurrencies(_ sender: Any) {
        guard let amount = convertFromTextField.text else{ return}
        
        if( amount == ""){
            return
        }
        guard let amount = Double(amount) else {return}
        presenter.convert(from: selectedConvertFrom, to: selectedConvertTo, amount: amount)
        
    }
    
    
    @IBAction func compareCurrencies(_ sender: Any) {
        guard let amount = compareFromTextField.text else{ return}
        
        if( amount == ""){
            return
        }
        guard let amount = Double(amount) else {return}
        
    }
}

extension ConversionViewController: ConversionVC{
    func setConvertTextField(rate: Double) {
        self.convertResultLabel.text = "\(rate)"
    }
    
    func setDataSource(list: [CurrencyList]) {
        
        dataSource = presenter.returnCurrenciesNamesList(currencies: list)
    }
    
    func setCountries(countries: [CurrencyList]) {
        self.countries = countries
    }
    
    
}

