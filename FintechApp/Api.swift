//
//  File.swift
//  FintechApp
//
//  Created by mac on 02/09/2021.
//

import Foundation


public let baseURL = "http://93.188.167.68:8008/api/"

public struct APIs{
    
 //MARK:- User api
    
    public static let createUser          = baseURL+"users/create"
    public static let login               = baseURL+"users/login"
    public static let forgotPassword      = baseURL+"users/forgotPassword"
    public static let categoryApi         = baseURL+"categories/list"
    
//MARK:- PRODUCT API
    
    public static let favourite         = baseURL+"products/favList/"
    
}
