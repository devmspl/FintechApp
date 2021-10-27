//
//  LoginVC.swift
//  FintechApp
//
//  Created by mac on 27/08/2021.
//

import UIKit

@available(iOS 13.0, *)
class LoginVC: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var btnViews: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func signInTapped(_ sender: UIButton) {
        
        let login = LoginModel(username: textFields[0].text!, password: textFields[1].text!)
        print(textFields[0].text!)
        ApiManager.sharedInstance.loginApi(model: login) { (isSuccess) in
            if isSuccess{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                self.alert(message: "Wrong username or password")
            }
        }
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func loginWithGoogle(_ sender: Any) {
    }
    @IBAction func forgetPassword(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordVC") as! ForgetPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func showPassword(_ sender: Any) {
    }
    
}
