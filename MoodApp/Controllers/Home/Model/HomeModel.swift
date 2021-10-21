//
//  HomeModel.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class HomeModel: Codable {

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
    
    init(user_id: String? = nil,first_name:String? = nil,last_name:String? = nil,user_password:String? = nil,status:String? = nil,city:String? = nil,country:String? = nil,about_me_description:String? = nil,user_type:String? = nil,login_type:String? = nil,phone_number:String? = nil,image_url:String? = nil,user_email:String? = nil,user_name:String? = nil) {
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
