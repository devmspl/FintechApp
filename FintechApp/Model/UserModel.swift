//
//  UserModel.swift
//  FintechApp
//
//  Created by mac on 02/09/2021.
//

import Foundation

struct CreateUserModel: Encodable{
    let username: String?
    let email: String?
    let password: String?
}

struct LoginModel: Encodable {
    let username: String?
    let password: String?
}
struct ForgetPasswordModel: Encodable {
    let email: String?
}
