//
//  LoginModel.swift
//  TastyBox
//
//  Created by Adeel on 11/05/2020.
//  Copyright © 2020 Buzzware. All rights reserved.
//

import UIKit

class LoginModel: Codable {

    var userId:String!
    var userFname:String!
    var userLname:String!
    var userPassword:String!
    var userStatus:String!
    var userCity:String!
    var userCountry:String!
    var userAboutMe:String!
    var userType:String!
    var userLoginType:String!
    var userPhone:String!
    var userImgurl:String!
    var userEmail:String!
    var userUsername:String!
    
    init(user_id: String,first_name:String,last_name:String,user_password:String,status:String,city:String,country:String,about_me_description:String,user_type:String,login_type:String,phone_number:String,image_url:String,user_email:String,user_name:String) {
        self.userId = user_id
        self.userFname = first_name
        self.userLname = last_name
        self.userPassword = user_password
        self.userStatus = status
        self.userCity = city
        self.userCountry = country
        self.userAboutMe = about_me_description
        self.userType = user_type
        self.userLoginType = login_type
        self.userPhone = phone_number
        self.userImgurl = image_url
        self.userEmail = user_email
        self.userUsername = user_name
        
    }
    init?(dic:NSDictionary) {
        
        
//        let user_id = (dic as AnyObject).value(forKey: Constant.user_id) as? String
//        let first_name = (dic as AnyObject).value(forKey: Constant.first_name) as? String
//        let last_name = (dic as AnyObject).value(forKey: Constant.last_name) as? String
//        let user_password = (dic as AnyObject).value(forKey: Constant.user_password) as? String
//        let status = (dic as AnyObject).value(forKey: Constant.status) as? String
//        let city = (dic as AnyObject).value(forKey: Constant.city) as? String
//        let country = (dic as AnyObject).value(forKey: Constant.country) as? String
//        let about_me_description = (dic as AnyObject).value(forKey: Constant.about_me_description) as? String
//        let user_type = (dic as AnyObject).value(forKey: Constant.user_type) as? String
//        let login_type = (dic as AnyObject).value(forKey: Constant.login_type) as? String
//        
//        let phone_number = (dic as AnyObject).value(forKey: Constant.phone_number) as? String
//        let image_url = (dic as AnyObject).value(forKey: Constant.image_url) as? String
//        let user_email = (dic as AnyObject).value(forKey: Constant.user_email) as? String
//        let user_name = (dic as AnyObject).value(forKey: Constant.user_name) as? String
//        
//        
//        self.userId = user_id
//        self.userFname = first_name
//        self.userLname = last_name
//        self.userPassword = user_password
//        self.userStatus = status
//        self.userCity = city
//        self.userCountry = country
//        self.userAboutMe = about_me_description
//        self.userType = user_type
//        self.userLoginType = login_type
//        self.userPhone = phone_number
//        self.userImgurl = image_url
//        self.userEmail = user_email
//        self.userUsername = user_name
        
    }
    
}
