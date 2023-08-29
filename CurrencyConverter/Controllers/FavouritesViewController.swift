//
//  FavouritesViewController.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 23/08/2023.
//

import UIKit
import SDWebImage

class FavouritesViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var favouritesTableView: UITableView!
    
    lazy var presenter = favouritesPresenter(view: self)
    var countries: [CurrencyList] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        wrapperView.layer.cornerRadius = 20
        wrapperView.layer.masksToBounds = true
        dismissButton.setTitle("", for: .normal)
        // Do any additional setup after loading the view.
        favouritesTableView.register(UINib(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouritesTableViewCell")
        
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
        presenter.getCountries()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dismissView(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
        dismiss(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
        dismiss(animated: true)
    }
    
}

extension FavouritesViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell") as? FavouritesTableViewCell{
            cell.selectionStyle = .none
            cell.currencyLabel.text = countries[indexPath.row].currencyCode
            cell.currencyImageView.maskCircle(url: countries[indexPath.row].flagURL!)
            cell.country = countries[indexPath.row]
            if(containsCountry(country: countries[indexPath.row])){
                cell.checkButton.isChecked = true
            }else{
                cell.checkButton.isChecked = false
            }
            
            
            
            return cell
            
            
        }
        
        return UITableViewCell()
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "My Favourites"
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}
extension FavouritesViewController: FavouritesVC{
    func setCountries(countriesList: [CurrencyList]?) {
        if let list = countriesList {
            countries = list
        }
    }
    
    func reloadTableView() {
        favouritesTableView.reloadData()
    }
    
    func containsCountry(country:CurrencyList)-> Bool{
        if let savedData = UserDefaults.standard.object(forKey: "favourites") as? Data {
            let decoder = JSONDecoder()
            if var loadedItems = try? decoder.decode([CurrencyList].self, from: savedData) {
                for i in loadedItems.indices{
                    if loadedItems[i].id == country.id{
                        return true
                    }
                }
                
            }
            
        }
        
        return false
    }
    
}
