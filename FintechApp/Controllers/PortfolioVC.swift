//
//  PortfolioVC.swift
//  FintechApp
//
//  Created by mac on 14/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage
import ARSLineProgress

class PortfolioVC: UIViewController {

    @IBOutlet weak var portImage: UIImageView!
    @IBOutlet weak var portLabel: UILabel!
    var productid = ""
    @IBOutlet weak var userTable: UITableView!{
        didSet{
            userTable.tableFooterView = UIView(frame: .zero)
        }
    }
    @IBOutlet var btnView: [UIButton]!
    @IBOutlet var graphView: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...btnView.count-1{
            btnView[i].layer.cornerRadius = 20
            btnView[i].layer.shadowRadius = 2
            btnView[i].layer.shadowOpacity = 1
            btnView[i].layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            btnView[i].layer.shadowColor = UIColor.gray.cgColor
        }
        for i in 0...graphView.count-1{
            graphView[i].layer.cornerRadius = 20
            graphView[i].layer.borderWidth = 1
            graphView[i].layer.borderColor = UIColor.gray.cgColor
        }
       
    }
    
    func GetProductbyID(){
        if ReachabilityNetwork.isConnectedToNetwork(){
            //ARSLineProgress.show()
            AF.request(APIs.productbyId+productid, method: .get).response{ [self]
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
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func finish1Tapped(_ sender: Any) {
    }
    @IBAction func finish2Tapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LegalPage1VC") as! LegalPage1VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class PortfolioTableCell: UITableViewCell{
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var discription: UITextField!
    @IBOutlet weak var name: UILabel!
}
