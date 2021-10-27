//
//  CategoryCell.swift
//  FintechApp
//
//  Created by mac on 25/10/2021.
//

import UIKit
import AlamofireImage
class CategoryCell: UICollectionViewCell {

    private var model: CategoryModel?
    
    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func config(with model: CategoryModel){
        self.model = model
        setData()
    }
    
    private func setData(){
        guard let model = model else{
            return
        }
        catName.text = model.name
        if let image = model.imageUrl as? String{
            if image != ""{
                let url = URL(string: image)
                self.img.af.setImage(withURL: url!)
            }else{
                img.image = UIImage(named: "agri")
            }
        }else{
            
        }
    }
    
}
