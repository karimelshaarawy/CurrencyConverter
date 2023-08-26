//
//  FavouritesTableViewCell.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 23/08/2023.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkButton: CheckBox!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyImageView: UIImageView!
    
    var country : CurrencyList?
    override func awakeFromNib() {
        super.awakeFromNib()
        checkButton.setTitle("", for: .normal)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func toggleFavourites(_ sender: CheckBox) {
        if let savedData = UserDefaults.standard.object(forKey: "favourites") as? Data {
            let decoder = JSONDecoder()
            if var loadedItems = try? decoder.decode([CurrencyList].self, from: savedData) {
                if let country = country{
                    if(checkButton.isChecked){
                        loadedItems = loadedItems.filter{$0.id != country.id}
                    }
                    else{
                        loadedItems.append(country)

                    }
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(loadedItems) {
                        UserDefaults.standard.set(encoded, forKey: "favourites")
                    }
                }
            }
        }else {
            if let country = country{
                var loadedItems:[CurrencyList] = []
                loadedItems.append(country)
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(loadedItems) {
                    UserDefaults.standard.set(encoded, forKey: "favourites")
                    
                }
                
            }
        }
    }
}
