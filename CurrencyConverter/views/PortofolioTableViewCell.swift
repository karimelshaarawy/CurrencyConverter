//
//  PortofolioTableViewCell.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 27/08/2023.
//

import UIKit

class PortofolioTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyValue: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
