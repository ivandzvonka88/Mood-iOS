//
//  LanguageHelper.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class LanguageHelper {
    
    static let sharedInstance = LanguageHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    
    func setupViewsForLanguageTextWrittingDirection(forView: UIView)
    {
        let currentSelectedLang:String? = LanguageHelper.sharedInstance.getCurrentSelectedLanguage()
        guard let currentLang:String = currentSelectedLang else
        {
            fatalError("Current Language cannot be nil")
        }
        
        if #available(iOS 9.0, *)
        {
            //            print("iOS >= 9.0.0")
            
            let symenticAttribute = forView.semanticContentAttribute
            let layoutDirection = UIView.userInterfaceLayoutDirection(for: symenticAttribute)
            if(layoutDirection == .leftToRight)
            {
                //                print("Current Language Direction = leftToRight")
                
                //                forView.semanticContentAttribute = .forceLeftToRight
            }
            else if(layoutDirection == .rightToLeft)
            {
                //                print("Current Language Direction = leftToRight")
                
                //                forView.semanticContentAttribute = .forceRightToLeft
            }
            
            
            if(currentLang == Globals.shared.kAppCurrentLanguage__English)
            {
                forView.semanticContentAttribute = .forceLeftToRight
            }
            else if(currentLang == Globals.shared.kAppCurrentLanguage__Urdu)
            {
                forView.semanticContentAttribute = .forceRightToLeft
            }
            
            
        }
        else
        {
            //            print("iOS < 9.0.0")
            
            let prefferedLang = NSLocale.preferredLanguages.first!
            if(NSLocale.characterDirection(forLanguage: prefferedLang) == .leftToRight)
            {
                //                print("Current Language Direction = leftToRight")
                
            }
            else
            {
                //                print("Current Language Direction = leftToRight")
            }
            
            if(currentLang == Globals.shared.kAppCurrentLanguage__Urdu)
            {
                if forView is UITextField
                {
                    let textFieldObj:UITextField = forView as! UITextField
                    
                    textFieldObj.textAlignment = .right
                }
                else if forView is UITextView
                {
                    let textViewObj:UITextView = forView as! UITextView
                    
                    textViewObj.textAlignment = .right
                }
                else if forView is UILabel
                {
                    let labelObj:UILabel = forView as! UILabel
                    
                    labelObj.textAlignment = .right
                }
                
            }
            else if(currentLang == Globals.shared.kAppCurrentLanguage__English)
            {
                if forView is UITextField
                {
                    let textFieldObj:UITextField = forView as! UITextField
                    
                    textFieldObj.textAlignment = .left
                }
                else if forView is UITextView
                {
                    let textViewObj:UITextView = forView as! UITextView
                    
                    textViewObj.textAlignment = .left
                }
                else if forView is UILabel
                {
                    let labelObj:UILabel = forView as! UILabel
                    
                    labelObj.textAlignment = .left
                }
                
            }
            
        }
        
    }
    
    
    func setCurrentSelectedLanguage(As languageToBeUsed:String) -> Void
    {
        let userDefaults = UserDefaults.standard
        userDefaults.set(languageToBeUsed, forKey: Globals.shared.kAppCurrentLanguage)
        userDefaults.synchronize()
    }
    
    func getCurrentSelectedLanguage() -> String?
    {
        let userDefaults = UserDefaults.standard
        let currentSelectedLanguage:String? = userDefaults.value(forKey: Globals.shared.kAppCurrentLanguage) as? String
        
        return currentSelectedLanguage
    }
    
    
}
