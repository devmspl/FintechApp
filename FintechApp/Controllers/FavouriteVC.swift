//
//  FavouriteVC.swift
//  FintechApp
//
//  Created by mac on 22/09/2021.
//

import UIKit

class FavouriteVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var favouriteTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTable.dequeueReusableCell(withIdentifier: "cell") as! FavouriteTabCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
class FavouriteTabCell: UITableViewCell{
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var cell_view: UIView!
    @IBOutlet weak var cell_image: UIImageView!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var favouriteLbl: UILabel!
    @IBOutlet weak var likebtn: UIButton!
    
    override func awakeFromNib() {
        cell_view.layer.cornerRadius = 20
        cell_image.layer.cornerRadius = 20
        viewImage.layer.cornerRadius = 20
        
        cell_view.layer.shadowRadius = 1
        cell_view.layer.shadowColor = UIColor.gray.cgColor
        cell_view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell_view.layer.shadowOpacity = 0.5
    }
}
