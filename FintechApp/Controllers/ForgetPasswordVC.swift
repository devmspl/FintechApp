//
//  ForgetPasswordVC.swift
//  FintechApp
//
//  Created by mac on 27/08/2021.
//

import UIKit
import Alamofire
import ARSLineProgress


class ForgetPasswordVC: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var btnViewe: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        if isValidEmail(emailValid: email.text!){
            let model = ForgetPasswordModel(email:email.text)
            ApiManager.sharedInstance.ForgetPassword(model: model) { (success) in
                if success{
                    let alert = UIAlertController.init(title: "FintechApp", message: "Please Login Now", preferredStyle: .alert)
                    let ok = UIAlertAction.init(title: "OK", style: .default) { (ok) in
                        let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
                        self.navigationController?.pushViewController(vc, animated: true)
                }
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }else{
                   
                    self.alert(message: "try again")
                }
            }
        }else{
            let vc = self.storyboard?.instantiateViewController(identifier: "OTPVC") as! OTPVC
            self.navigationController?.pushViewController(vc, animated: true)
            self.alert(message: "Enter valid email")
        }
        
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func isValidEmail(emailValid:String) -> Bool {
        let emailRegEx = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{1,4}$"
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: emailValid)
    }
}

