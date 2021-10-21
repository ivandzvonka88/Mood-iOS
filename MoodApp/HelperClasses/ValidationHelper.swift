//
//  ValidationHelper.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class ValidationHelper {
    
    static let sharedInstance = ValidationHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    
    class func isStringEmpty(_ inputString: String?) -> Bool {
        
        if inputString == nil || (inputString?.count ?? 0) == 0 || (inputString == "") || (inputString == "(null)") {
            return true
        }
        //string is all whitespace
        if inputString?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).count == 0 {
            return true
        }
        
        return false
    }
    
    
    class func isNumeric(_ inputString: String?) -> Bool
    {
        let cs = CharacterSet(charactersIn: "0123456789").inverted
        var filtered: String
        filtered = inputString?.components(separatedBy: cs).joined(separator: "") ?? ""
        
        return inputString == filtered
    }
    
    
    
    class func isFloat(_ inputString: String?) -> Bool {
        
        let cs = CharacterSet(charactersIn: ".0123456789").inverted
        var filtered: String
        filtered = inputString?.components(separatedBy: cs).joined(separator: "") ?? ""
        
        return inputString == filtered
    }
    
    
    
    class func isAlphaNumeric(_ inputString: String?) -> Bool
    {
        let blockedCharacters = CharacterSet.alphanumerics.inverted
        return Int((inputString as NSString?)?.rangeOfCharacter(from: blockedCharacters).location ?? 0) == NSNotFound
    }
    
    class func isAlphabetOnly(_ inputString: String?) -> Bool
    {
        let cs = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ").inverted
        var filtered: String
        filtered = inputString?.components(separatedBy: cs).joined(separator: "") ?? ""
        
        return inputString == filtered
    }
    
    class func isAlphabet(withSpaceOnly inputString: String?) -> Bool
    {
        let cs = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ").inverted
        var filtered: String
        filtered = inputString?.components(separatedBy: cs).joined(separator: "") ?? ""
        
        return inputString == filtered
    }
    
    class func isAlphabet(withDotAndUnderscoreOnly inputString: String?) -> Bool
    {
        let cs = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._").inverted
        var filtered: String
        filtered = inputString?.components(separatedBy: cs).joined(separator: "") ?? ""
        
        return inputString == filtered
    }
    
    class func isAlphaNumeric(withDotAndUnderscoreOnly inputString: String?) -> Bool
    {
        let cs = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._0123456789").inverted
        var filtered: String
        filtered = inputString?.components(separatedBy: cs).joined(separator: "") ?? ""
        
        return inputString == filtered
    }
    
    
    
    
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    class func isValidEmail2(_ emailString: String?) -> Bool
    {
        var emailString = emailString
        
        // lowercase the email for proper validation
        emailString = emailString?.lowercased()
        // regex for email validation
        let emailRegEx = """
            (?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}\
            ~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\\
            x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-\
            z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5\
            ]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-\
            9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\
            -\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])
            """
        let regExPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let myStringMatchesRegEx: Bool = regExPredicate.evaluate(with: emailString)
        
        return myStringMatchesRegEx
    }
    
    
    
    
}
