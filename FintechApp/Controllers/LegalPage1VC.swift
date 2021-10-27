//
//  LegalPage1VC.swift
//  FintechApp
//
//  Created by mac on 14/08/2021.
//

import UIKit

class LegalPage1VC: UIViewController {
//outlets
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var descriptionLegal: UILabel!
    @IBOutlet weak var textViews: UITextView!
    
    @IBOutlet weak var agreePolicy: UIView!
    @IBOutlet var btnView: [UIButton]!
//viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...btnView.count-1{
            btnView[i].layer.cornerRadius = 15
            btnView[0].layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMaxYCorner]
            btnView[1].layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
        }
        saveView.layer.cornerRadius = 20
        saveView.layer.borderWidth = 1
        saveView.layer.borderColor = UIColor.gray.cgColor
        
        agreePolicy.layer.cornerRadius = 20
    }
//button
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearTapped(_ sender: Any) {
        textViews.text = ""
    }
    @IBAction func saveTapped(_ sender: Any) {
       alert(message: "Saved Successful")
        textViews.text = ""
    }
    @IBAction func agreePolicyTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Legal2VC") as! Legal2VC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension UIViewController {
    
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
    
 // showAlertWithOneAction
 func showAlertWithOneAction(alertTitle:String, message: String, action1Title:String, completion1: ((UIAlertAction) -> Void)? = nil){
            let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: action1Title, style: .default, handler: completion1))
            self.present(alert, animated: true, completion: nil)
        }
    
//showAlertWithTwoActions
    func showAlertWithTwoActions(alertTitle:String, message: String, action1Title:String, action1Style: UIAlertAction.Style ,action2Title: String ,completion1: ((UIAlertAction) -> Void)? = nil,completion2 :((UIAlertAction) -> Void)? = nil){
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action1Title, style: action1Style, handler: completion1))
        alert.addAction(UIAlertAction(title: action2Title, style: .default, handler: completion2))
        self.present(alert, animated: true, completion: nil)
    }
}
