//
//  SignUpVC.swift
//  FintechApp
//
//  Created by mac on 27/08/2021.
//

import UIKit

@available(iOS 13.0, *)
class SignUpVC: UIViewController {
    
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
//        let alert = UIAlertController.init(title: "FintechApp", message: "Registered sucessfully please Login now to continue", preferredStyle: .alert)
//                        let ok = UIAlertAction.init(title: "OK", style: .default) { (ok) in
//                            let vc = self.stworyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
//                            self.navigationController?.pushViewController(vc, animated: true)
//                        }
//                        alert.addAction(ok)
//                        self.present(alert, animated: true, completion: nil)
        let signupmodel = CreateUserModel(username: textFields[1].text, email: textFields[0].text, password: textFields[2].text)
        ApiManager.sharedInstance.SignUpAPI(model: signupmodel) { (isSuccess) in
            if isSuccess{
                let alert = UIAlertController.init(title: "FintechApp", message: "Please Login Now", preferredStyle: .alert)
                let ok = UIAlertAction.init(title: "OK", style: .default) { (ok) in
                    let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginVC
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }else{

            }
        }
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
