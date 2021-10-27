//
//  Legal2VC.swift
//  FintechApp
//
//  Created by mac on 14/08/2021.
//

import UIKit

@available(iOS 13.0, *)
class Legal2VC: UIViewController {

    @IBOutlet var textViews: [UIView]!
    @IBOutlet var btnViews: [UIView]!
    @IBOutlet weak var checkBox: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBox.setImage(UIImage(named: "checkBox"), for: .normal)
        for i in 0...textViews.count-1{
            textViews[i].layer.cornerRadius = 15
            textViews[i].layer.borderWidth = 1
            textViews[i].layer.borderColor = UIColor.gray.cgColor
        }
        for i in 0...btnViews.count-1{
            btnViews[i].layer.cornerRadius = 20
            btnViews[i].layer.shadowColor = UIColor.gray.cgColor
            btnViews[i].layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            btnViews[i].layer.shadowRadius = 1
            btnViews[i].layer.shadowOpacity = 0.5
        }

    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func investNow(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func purchaseTapped(_ sender: Any) {
    }
    @IBAction func checkBoxTapped(_ sender: Any) {
        if checkBox.image(for: .normal) == UIImage(named: "checkBox"){
            checkBox.setImage(UIImage(named: "checked"), for: .normal)
        }else{
            checkBox.setImage(UIImage(named: "checkBox"), for: .normal)
        }
    }
}
