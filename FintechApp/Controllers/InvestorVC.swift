//
//  InvestorVC.swift
//  FintechApp
//
//  Created by mac on 04/08/2021.
//

import UIKit
import Alamofire
import ARSLineProgress
import AlamofireImage

class InvestorVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//outlets
    @IBOutlet weak var upperCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var lowerCollection: UICollectionView!
    
    var catArray = [AnyObject]()
   // var Catmodel : CategoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         cat()
   }
    
//collectionViewFunction
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upperCollection{
            return 3
        }else{
            return catArray.count
        }
    }
    
    
    func cat(){
        if ReachabilityNetwork.isConnectedToNetwork(){
            //ARSLineProgress.show()
            AF.request(APIs.categoryApi, method: .get).response{ [self]
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
                            self.catArray = data
                           
                            self.lowerCollection.reloadData()
                           
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

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upperCollection{
            let cell = upperCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpperCollectionCell
            return cell
        }
        else{
            let cell = lowerCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCell
            cell.catName.text = catArray[indexPath.item]["name"] as? String
            if let image = catArray[indexPath.item]["imageUrl"] as? String{
                if image != ""{
                    let url = URL(string: image)
                    cell.img.af.setImage(withURL: url!)
                }else{
                    cell.img.image = UIImage(named: "agri")
                }
           
            
        }
            return cell
    }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == upperCollection{
            return CGSize(width: upperCollection.frame.width, height: upperCollection.frame.height)
        }else{
            return CGSize(width: lowerCollection.frame.width/2, height: lowerCollection.frame.height/2)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == lowerCollection{
        let vc = storyboard?.instantiateViewController(withIdentifier: "SubCategoryVC") as! SubCategoryVC
        vc.categoryKiid = catArray[indexPath.item]["id"] as! String
        self.navigationController?.pushViewController(vc, animated: true)
    }
    }
 //button
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}

//collectionCell
class UpperCollectionCell: UICollectionViewCell{

    @IBOutlet weak var upperCollImage: UIImageView!
}

class LowerCollectionCell: UICollectionViewCell{
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var lowerCollImage: UIImageView!
    @IBOutlet weak var lowerCollText: UILabel!
    
    override func awakeFromNib() {
        lowerCollImage.layer.cornerRadius = 20
    }
}

