//
//  CategoryModel.swift
//  FintechApp
//
//  Created by mac on 25/10/2021.
//

import Foundation

//"id": "6149bb5b8ddca611b7b0da92",
//      "name": "Agriculture solution's",
//      "status": "inactive",
//      "description": "string",
//      "imageUrl": ""

struct CategoryModel{
    var id:String = ""
    var name: String = ""
    var status: String = ""
    var description: String = ""
    var imageUrl: String = ""

    
    init(categoryDetails:[String:Any]) {
        
        id = categoryDetails["id"] as? String ?? ""
        name = categoryDetails["name"] as? String ?? ""
        status = categoryDetails["status"] as? String ?? ""
        description = categoryDetails["description"] as? String ?? ""
        imageUrl = categoryDetails["imageUrl"] as? String ?? ""
        
    }
}
