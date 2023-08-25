//
//  FavouritesViewController.swift
//  CurrencyConverter
//
//  Created by Karim Elshaarawy on 23/08/2023.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var favouritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        wrapperView.layer.cornerRadius = 20
        wrapperView.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        favouritesTableView.register(UINib(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouritesTableViewCell")
        
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavouritesViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell") as? FavouritesTableViewCell{
            cell.selectionStyle = .none
            return cell}
        
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

