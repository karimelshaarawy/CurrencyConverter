//
//  CustomDropDownCell.swift
//  CurrencyConverter
//
//  Created by Ayman Fathy on 26/08/2023.
//

import UIKit
import DropDown
class CustomDropDownCell: DropDownCell {
    
    @IBOutlet weak var flagimageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        flagimageView.clipsToBounds = true
        flagimageView.layer.cornerRadius = 17.5
        flagimageView.layer.borderColor = UIColor.black.cgColor
        flagimageView.layer.borderWidth = 0.1
        
    }
}
