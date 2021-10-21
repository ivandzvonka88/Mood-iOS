//
//  Globals.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class Globals
{
    static let shared = Globals()
    
    //Initializer access level change now
    private init(){}
    
    
    // MARK: - App Infos
    public let APP_NAME:String = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String)!
    public let APP_VERSION = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
    public let APP_BUILD = Bundle.main.infoDictionary!["CFBundleVersion"] as? String
    
    public let APP_ID:String = "711338920"
    public let COMPANY_NAME:String = "Wadic"
    public let POWERED_BY_COMPANY_NAME:String = "Copyright 2019"
    public let kEmail_COMPANY_CONTACT_EMAIL:String = "contactus@wadic.com"
    public let kEmail_CC:String = ""
    public let kEmail_BCC:String = ""
    public let APP_STORE_URL:String = ""
    public let APP_STORE_REVIEW_URL:String = ""
    
    
    // MARK: - Typedefs
    typealias OperationCompletionBlock = (Bool, Error?) -> Void
    
    static let iphoneSE_hieght1:CGFloat = 568
    static let iphone8_hieght2:CGFloat = 667
    static let iphone8Plus_hieght3:CGFloat = 736
    static let iphoneX_hieght4:CGFloat = 812
    static let iphone7Plus_hieght5:CGFloat = 847
    static let iphonePro_hieght6:CGFloat = 844
    static let iphoneXsMax_hieght7:CGFloat = 896
    static let iphoneProMax_hieght8:CGFloat = 926
    
    
    
    
    // MARK: - Date Formates
    public let DateFormate__AM_Symbol:String                        = "AM";
    public let DateFormate__PM_Symbol:String                        = "PM";
    
    public let DateFormate__dd_MMMM_yyyy:String                     = "dd MMMM yyyy";
    public let DateFormate__yyyy_MM_dd:String                       = "yyyy-MM-dd";
    public let DateFormate__dd_MM_yyyy:String                       = "dd/MM/yyyy";
    public let DateFormate__MMM_dd:String                          = "MMM dd";
    
    public let DateTimeFormate__dd_MMMM_yyyy_hh_mm_ss:String        = "dd MMMM yyyy hh:mm:ss";
    public let DateTimeFormate__yyyy_MM_dd_hh_mm_ss:String          = "yyyy-MM-dd hh:mm:ss";
    public let DateTimeFormate__yyyy_MM_dd_HH_mm_ss:String          = "yyyy-MM-dd HH:mm:ss";
    public let DateTimeFormate__yyyy_MM_dd_HH_mm_a:String           = "yyyy-MM-dd HH:mm a";
    public let DateTimeFormate__yyyy_MM_dd_HH_mm_ss_a:String        = "yyyy-MM-dd HH:mm:ss a";
    public let DateTimeFormate__yyyy_MM_dd_hh_mm_ss_a:String        = "yyyy-MM-dd hh:mm:ss a";
    public let DateTimeFormate__dd_MMM_yyyy_hh_mm_a:String          = "dd MMM yyyy hh:mm a";
    public let DateTimeFormate__EEE_dd_MMM_yyyy_HH_mm_ss_ZZZ:String = "EEE, dd MMM yyyy HH:mm:ss ZZZ";
    public let DateTimeFormate__dd_MMM_yyyy:String                  = "dd MMM yyyy";
    public let DateTimeFormate__dd_MMM_at_yyyy_HH_mm_a:String       = "dd MMM yyyy @ HH:mm a";
    public let DateTimeFormate__dd_MMM_at_yyyy_hh_mm_a:String       = "dd MMM yyyy @ hh:mm a";
    public let DateTimeFormate__HH_mm_ZZZ:String                    = "HH:mm ZZZ";
    public let DateTimeFormate__HH_mm_a:String                      = "HH:mm a";
    public let DateTimeFormate__HH_mm_ss:String                     = "HH:mm:ss";
    public let DateTimeFormate__hh_mm_ss:String                     = "hh:mm:ss";
    public let DateTimeFormate__hh_mm_ss_a:String                   = "hh:mm:ss a";
    public let DateTimeFormate__hh_mm_a:String                      = "hh:mm a";
    
    
    // MARK: - App Language
    public let kAppCurrentLanguage = "appCurrentLanguage"
    public let kAppCurrentLanguage__English = "appCurrentLanguageEnglish"
    public let kAppCurrentLanguage__Urdu = "appCurrentLanguageUrdu"
    
    // Application Language
    public let kApplicationLanguage_English = "en"
    public let kApplicationLanguage_urdu = "ur"
    
    
    // MARK: -  Common
    public let kInvisibleSignChar:String = "\u{200B}"
    
    // MARK: -  First Time App Loaded
    public let kIsFirstTimeAppLoad:String = "isFirstTimeAppLoad"
    
    // MARK: - Mime Types
    public let MimeType__TEXT_Plain:String = "text/plain"
    public let MimeType__TEXT_JSON:String = "text/json"
    
    
    // MARK: - User Password Minimum Length
    public let kValidationRestriction__UserPasswordMinimumLength: Int = 6
    
    
    // MARK: - Colors
    // Application Color Scheme
    public let kColor__AppColorScheme_Orange:String = "#FCB203"
    
    public let kColor__AppColorScheme_NavBackGroundColor:String = "#019AE8"//Set Done
    public let kColor__AppColorScheme_NavBackButtonColor:String = "#FFFFFF"//Set Done
    
    // TextView
    public let kColor__AppColorScheme_TextViewBackground:String = "#84E1EA"
    public let kColor__AppColorScheme_TextViewBorder:String = "#FFFFFF"
    public let kColor__AppColorScheme_TextViewPlaceHolderColor:String = "#677479"
    public let kColor__AppColorScheme_TextViewTextColor:String = "#FFFFFF"
    public let kColor__AppColorScheme_TableRowSelectionColor:String = "#83B0BB"
    
    public let colorForTextBoxPlaceHolder:String = "C7C7CC"
    public let colorForTextBoxBorders:String = "E7E7E7"
    
    // Validation Color
    public let kColor__Message:String = "#1085DB"
    public let kColor__Success:String = "#1B934B"
    public let kColor__Warning:String = "FEC536"
    public let kColor__Error:String   = "#D23935"
    
    // Attributed Label
    public let kColor_AttributedLabel_LinkUnderLineText:String = "#FFFFFF"
    public let kColor_AttributedLabel_LinkUnderLine:String = "#FFFFFF"
    
    // Validation Type
    public let kAlertPopUpType__Message:Int                 = 1
    public let kAlertPopUpType__Success:Int                 = 2
    public let kAlertPopUpType__Warning:Int                 = 3
    public let kAlertPopUpType__Error:Int                   = 4
    
    
    
    // MARK: -  Scope
    public let kHeader__app_x_www_form_urlencoded:String = "application/x-www-form-urlencoded"
    public let kHeader__app_json:String                  = "application/json; charset=utf-8"
    
    
    
    // MARK: - Touch On Status Bar Notification
    public let kTouchOnStatusBarNotification:String = "touchOnStatusBar"
    
    // MARK: - Segues Identifiers
    public let from_login_to_home = "from_login_to_home"
    
    public static func ShowAlert(view: UIViewController,message:String,Title:String)
    {
        let alert = UIAlertController(title: Title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            print(message)
        }))
        view.present(alert, animated: true, completion: nil)
    }
}

