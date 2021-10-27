//
//  ViewController.swift
//  FintechApp
//
//  Created by mac on 29/07/2021.
//

import UIKit

class StartVC: UIViewController {

    @IBOutlet weak var btnView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnView.layer.cornerRadius = 20
        btnView.layer.shadowOpacity = 1
        btnView.layer.shadowRadius = 4
        btnView.layer.shadowColor = UIColor.gray.cgColor
        btnView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    @IBAction func getStartedTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

