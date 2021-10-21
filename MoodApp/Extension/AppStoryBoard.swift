//
//  AppStoryBoard.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class AppStoryBoard: NSObject {

}
extension UIStoryboard {
    
    //MARK:- Generic Public/Instance Methods
    
    func loadViewController(withIdentifier identifier: viewControllers) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    //MARK:- Class Methods to load Storyboards
    
    class func storyBoard(withName name: storyboards) -> UIStoryboard {
        return UIStoryboard(name: name.rawValue , bundle: Bundle.main)
    }
    
    class func storyBoard(withTextName name:String) -> UIStoryboard {
        return UIStoryboard(name: name , bundle: Bundle.main)
    }
    
}

enum storyboards : String {
    case login = "Registration",
    leftMenu = "LeftMenu",
    home = "Home",
    settings = "Settings",
    modules = "Modules",
    partner = "Partner",
    account = "Account",
    dashboard = "Dashboard",
    messages = "Messages",
    sales = "Sales",
    popUps = "PopUps",
    main = "Main"
}



//navLoginVC = "navLoginVC",
//navLeftMenuVC = "navLeftMenuVC",
//leftMenuVC = "LeftMenuVC",
//navHomeVC = "navHomeVC",
//homeVC = "HomeVC",
//swRevealViewController = "SWRevealViewController",
//homeDetailVC = "HomeDetailVC",
enum viewControllers: String {
    
    //Login Storyboard
    case loginVC = "LoginVC__SB_ID",
    registerVC = "RegisterVC__SB_ID",
    
    dashboardVC = "DashboardVC__SB_ID",
    aboutVC = "AboutVC__SB_ID",
    
    settingsVC = "SettingsVC__SB_ID",
    
    modulesVC = "ModulesVC__SB_ID",
    
    partnerVC = "PartnerVC__SB_ID",
    
    messagesVC = "MessagesVC__SB_ID",
    messagesTabBarVC = "MessagesTabBarVC__SB_ID",
    
    accountVC = "AccountVC__SB_ID",
    
    salesVC = "SalesVC__SB_ID",
    
    popUpVC = "PopUpVC__SB_ID"
}
