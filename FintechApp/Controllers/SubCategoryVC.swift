//
//  SubCategoryVC.swift
//  FintechApp
//
//  Created by mac on 04/08/2021.
//

import UIKit

class SubCategoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var subCatTable: UITableView!{
        didSet{
            subCatTable.tableFooterView = UIView(frame: .zero)
        }
    }
   @IBOutlet weak var bannerPhoto: UIImageView!

//viewdidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subCatTable.dequeueReusableCell(withIdentifier: "cell") as! SubCategoryTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PortfolioVC") as! PortfolioVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        
    }
}
class SubCategoryTableCell: UITableViewCell{
    
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var favouriteLabel: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var cell_image: UIImageView!
    @IBOutlet weak var cell_view: UIView!
    
    override func awakeFromNib() {
        
        cell_image.layer.cornerRadius = 20
        cell_view.layer.cornerRadius = 20
        cell_view.layer.shadowRadius = 5
        cell_view.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell_view.layer.shadowOpacity = 1
        cell_view.layer.shadowColor = UIColor.lightGray.cgColor
        
    }
}
