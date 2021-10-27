//
//  InstitutionVC.swift
//  FintechApp
//
//  Created by mac on 03/08/2021.
//

import UIKit

class InstitutionVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var viewInScroll: UIView!
    @IBOutlet var textViews: [UIView]!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//textView
        for i in 0...textViews.count-1{
            textViews[i].layer.cornerRadius = 20
            textViews[i].layer.borderWidth = 1
            textViews[i].layer.borderColor = UIColor.gray.cgColor
        }
//btnView
        btnView.layer.cornerRadius = 15
        btnView.layer.shadowColor = UIColor.gray.cgColor
        btnView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        btnView.layer.shadowRadius = 4
        btnView.layer.shadowOpacity = 1
// mainView
        mainView.layer.cornerRadius = 20
        scroll_view.layer.cornerRadius = 20
        viewInScroll.layer.cornerRadius = 20
        }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
