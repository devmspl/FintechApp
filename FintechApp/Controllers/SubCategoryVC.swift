//
//  SubCategoryVC.swift
//  FintechApp
//
//  Created by mac on 04/08/2021.
//

import UIKit
import AlamofireImage
import Alamofire
import ARSLineProgress

class SubCategoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var subCatTable: UITableView!{
        didSet{
            subCatTable.tableFooterView = UIView(frame: .zero)
        }
    }
    var categoryKiid = ""
    
    var Productarr = [AnyObject]()
   @IBOutlet weak var bannerPhoto: UIImageView!

//viewdidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetcatProductsAPI()

    }
    
    func GetcatProductsAPI(){
        if ReachabilityNetwork.isConnectedToNetwork(){
            //ARSLineProgress.show()
            AF.request(APIs.productbycatApi+categoryKiid+"?pageNo=1&pageSize=1000", method: .get).response{ [self]
                response in
                print(response)
                switch response.result{
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        if response.response?.statusCode == 200 {
                            ARSLineProgress.hide()
                             let response = json as! NSDictionary
                             let data = response.object(forKey: "data") as! [AnyObject]
                             self.Productarr = data
                           
                            self.subCatTable.reloadData()
                           
                        }else{
                            ARSLineProgress.hide()
                        }
                    }catch{
                        print(error.localizedDescription)
                       
                        ARSLineProgress.hide()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    ARSLineProgress.hide()
                }
            }
        }else{
            ARSLineProgress.hide()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Productarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = subCatTable.dequeueReusableCell(withIdentifier: "cell") as! SubCategoryTableCell
        cell.type.text = Productarr[indexPath.item]["name"] as? String
        cell.discription.text = Productarr[indexPath.item]["description"] as? String
        if let image = Productarr[indexPath.item]["imageUrl"] as? String{
            if image != ""{
                let url = URL(string: image)
                cell.cell_image.af.setImage(withURL: url!)
            }else{
                cell.cell_image.image = UIImage(named: "agri")
            }
        
    }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PortfolioVC") as! PortfolioVC
        vc.productid = Productarr[indexPath.item]["id"] as! String
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        
    }
}

class SubCategoryTableCell: UITableViewCell{
    
    private var model : SubCategoryModel?
    
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
    
    public func config(with model: SubCategoryModel){
        self.model = model
        setData()
    }
    
    private func setData(){
        guard let model = model else{
            return
        }
        
        type.text = model.name
        discription.text = model.description
        if let image = model.imageUrl as? String{
            if image != ""{
                let url = URL(string: image)
                self.cell_image.af.setImage(withURL: url!)
            }else{
                cell_image.image = UIImage(named: "agri")
            }
        }else{
            
        }
    }
    
    
}
