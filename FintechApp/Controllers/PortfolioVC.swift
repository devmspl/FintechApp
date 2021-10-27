//
//  PortfolioVC.swift
//  FintechApp
//
//  Created by mac on 14/08/2021.
//

import UIKit

class PortfolioVC: UIViewController {

    @IBOutlet weak var portImage: UIImageView!
    @IBOutlet weak var portLabel: UILabel!
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
