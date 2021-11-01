//
//  ApiManager.swift
//  FintechApp
//
//  Created by mac on 02/09/2021.
//

import Foundation
import Alamofire
import ARSLineProgress


class ApiManager{
    static let sharedInstance = ApiManager()

//MARK:- SIGNUP API
    
    func SignUpAPI(model: CreateUserModel, completionHandler: @escaping (Bool) -> ()){
        if ReachabilityNetwork.isConnectedToNetwork(){
           // ARSLineProgress.show()
            AF.request(APIs.createUser, method: .post, parameters: model, encoder: JSONParameterEncoder.default).response{
                respone in
                print(respone)
                switch respone.result{
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        if respone.response?.statusCode == 200 {
                            ARSLineProgress.hide()
                            completionHandler(true)
                        }else{
                            ARSLineProgress.hide()
                        }
                    }catch{
                        print(error.localizedDescription)
                        completionHandler(false)
                        ARSLineProgress.hide()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(false)
                    ARSLineProgress.hide()
                }
            }
        }else{
            ARSLineProgress.hide()
        }
    }
    
//MARK:- LOGIN API
    
    func loginApi(model: LoginModel,completionHandler: @escaping (Bool) ->()){
        if ReachabilityNetwork.isConnectedToNetwork(){
            //ARSLineProgress.show()
            AF.request(APIs.login,method: .post,parameters: model,encoder: JSONParameterEncoder.default).response{
                response in
                switch(response.result){
                case .success(let data):do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print("json",json)
                    let res = json as! NSDictionary
                    if response.response?.statusCode == 200{
                        completionHandler(true)
                        let data = res.object(forKey: "data") as! NSDictionary
                        let userId = data.object(forKey: "id") as! String
                        let token = data.object(forKey: "token") as! String
                         UserDefaults.standard.set(userId, forKey: "user")
                        UserDefaults.standard.set(token, forKey: "token")
                        ARSLineProgress.hide()
                    }else{
                        ARSLineProgress.hide()
                    }
                }catch{
                    print(error.localizedDescription)
                    completionHandler(false)
                    ARSLineProgress.hide()
                }
                case .failure(let error):do{
                    print(error.localizedDescription)
                    completionHandler(false)
                    ARSLineProgress.hide()
                    
                }
                }
            }
        }else{
           print("No internet connection")
            ARSLineProgress.hide()
        }
    }
    
//MARK:- FORGET PASSWORD
    func ForgetPassword(model: ForgetPasswordModel, completionHandler: @escaping (Bool) -> ()){
        if ReachabilityNetwork.isConnectedToNetwork(){
           // ARSLineProgress.show()
            AF.request(APIs.forgotPassword, method: .post, parameters: model, encoder: JSONParameterEncoder.default).response{
                response in
                print(response)
                switch response.result{
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        if response.response?.statusCode == 200 {
                            ARSLineProgress.hide()
                            completionHandler(true)
                        }else{
                            ARSLineProgress.hide()
                        }
                    }catch{
                        print(error.localizedDescription)
                        completionHandler(false)
                        ARSLineProgress.hide()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(false)
                    ARSLineProgress.hide()
                }
            }
        }else{
            ARSLineProgress.hide()
        }
    }

 //MARK:- CATEGORY API
    
   
}

