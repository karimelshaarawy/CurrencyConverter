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
        flagimageView.layer.cornerRadius = 20
        
    }
}
