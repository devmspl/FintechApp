//
//  FirstPageVC.swift
//  FintechApp
//
//  Created by mac on 03/08/2021.
//

import UIKit

class FirstPageVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet var btnViews: [UIView]!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var pageControll: UIPageControl!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        for i in 0...btnViews.count-1{
            btnViews[i].layer.cornerRadius = 20
            btnViews[i].layer.shadowOpacity = 1
            btnViews[i].layer.shadowRadius = 4
            btnViews[i].layer.shadowColor = UIColor.gray.cgColor
            btnViews[i].layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        }
   }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BannerCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollection.frame.width, height: bannerCollection.frame.height)
    }
    
    @IBAction func investorTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InvestorVC") as! InvestorVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func institutionTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "InstitutionVC") as! InstitutionVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
class BannerCollectionCell: UICollectionViewCell{
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var descript: UILabel!
}

