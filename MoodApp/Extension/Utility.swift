//
//  Utility.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

import SystemConfiguration


class Utility: NSObject
{
    
    //var version = "Api"
    //var mainUrl = "http://ebmacshost.com/comic/"
    static let sharedInstance = Utility()  // singleton object
    
    override init() {
        // do initial setup or establish an initial connection
    }
    static var sharedInstance1: Utility = {
        
        return Utility()
    }()
    func getData() -> [String:String] {
        // do some operations
        return ["someData" : "someData"]
    }
    func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
    
    
    func loginwebservice() -> String {
        let webService = Constant.mainUrl + "/login"
        return webService
    }
    
    
    func signupwebservice() -> String {
        let webService = Constant.mainUrl + "/newregister/normal"
        return webService
    }
    
    
    func passwordrecover() -> String {
        let webService = Constant.mainUrl + "/forgotpassword"
        return webService
    }
    
    func updateAvatar() -> String{
        let webService = Constant.mainUrl + "/update_profile/"
        return webService
    }
    
    
    func updateInfo() -> String{
        let webService = Constant.mainUrl + "/save_info/"
        return webService
    }
    
    
    func facebookloginfunction() -> String {
        let webService = Constant.mainUrl + "/fb"
        return webService
    }
    
    
    func getcomicCategories() -> String {
        let webService = Constant.mainUrl + "/get_categories/"
        return webService
    }
    
    
    func getcomicDetail() -> String {
        let webService = Constant.mainUrl + "/getComic/"
        return webService
    }
    
    
    func followUnfollow() -> String {
        let webService = Constant.mainUrl + "/follower"
        return webService
    }
    
    func instagramlogin() -> String {
        let webService = Constant.mainUrl + "/register/instagrame"
        return webService
    }
    
    
    func twitterlogin() -> String {
        let webService = Constant.mainUrl + "/register/twitter"
        return webService
    }
    func addNewComic() -> String {
        let webService = Constant.mainUrl + "/Add_comic/"
        return webService
    }
    func deleteComic() -> String {
        let webService = Constant.mainUrl + "/delete_comic/"
        return webService
    }
    func myComicDetail() -> String {
        let webService = Constant.mainUrl + "/MyComic/"
        return webService
    }
    func newInsertChat() -> String {
        let webService = Constant.mainUrl + "/Chat/insertchat"
        return webService
    }
    func userChatRead() -> String {
        let webService = Constant.mainUrl + "/Chat/read"
        return webService
    }
    func chatListAll() -> String {
        let webService = Constant.mainUrl + "/Chat/massage_list"
        return webService
    }
    
    //    func getModelVehicleWebService() -> String {
    //        let webService = mainUrl + version + "/vahical_fetch_brand_model"
    //        return webService
    //    }
    
    //    func getModelVehicleWebService() -> String {
    //        let webService = mainUrl + version + "/vahical_fetch_brand_model"
    //        return webService
    //    }
    
}

