//
//  UiSegmentControll+Additions.swift
//  Heylo
//
//  Created by Adeel on 13/01/2021.
//  Copyright © 2021 Buzzware. All rights reserved.
//

import UIKit

class UiSegmentControll_Additions: NSObject {

}
extension UISegmentedControl{
    
    @IBInspectable
    var selectedColor: UIColor? {
        get {
            if let attribute = titleTextAttributes(for: .selected) {
                if let color = attribute[NSAttributedString.Key.foregroundColor]{
                    return UIColor(cgColor: color as! CGColor)
                }
            }
            return nil
        }
        set {
            if let color = newValue {
                if UIDevice.current.userInterfaceIdiom == .phone{
                    setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color,NSAttributedString.Key.font : UIFont(name: Constant.GothamRounded_Book, size: 14) ?? UIFont.systemFont(ofSize: 14)], for: .selected)
                }
                else{
                    setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color,NSAttributedString.Key.font : UIFont(name: Constant.GothamRounded_Book, size: 17) ?? UIFont.systemFont(ofSize: 17)], for: .selected)
                }
            } else {
                setTitleTextAttributes(nil, for: .selected)
            }
        }
    }
    @IBInspectable
    var normalColor: UIColor? {
        get {
            if let attribute = titleTextAttributes(for: .normal) {
                if let color = attribute[NSAttributedString.Key.foregroundColor]{
                    return UIColor(cgColor: color as! CGColor)
                }
            }
            
            return nil
        }
        set {
            if let color = newValue {
                if UIDevice.current.userInterfaceIdiom == .phone{
                    setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color,NSAttributedString.Key.font : UIFont(name: Constant.GothamRounded_Book, size: 14) ?? UIFont.systemFont(ofSize: 14)], for: .normal)
                }
                else{
                    setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color,NSAttributedString.Key.font : UIFont(name: Constant.GothamRounded_Book, size: 17) ?? UIFont.systemFont(ofSize: 17)], for: .normal)
                }
                
            } else {
                setTitleTextAttributes(nil, for: .normal)
            }
        }
    }
    
}

