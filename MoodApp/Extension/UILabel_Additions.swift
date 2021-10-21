//
//  UILabel_Additions.swift
//  CashApp
//
//  Created by Buzzware Tech on 02/03/2021.
//

import UIKit

class UILabel_Additions: UILabel {

    override func draw(_ rect: CGRect) {
        
    }
}

class GothamRounded_Book16: UILabel {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var size:CGFloat = 0
        let frame = UIScreen.main.bounds
        switch frame.height {
        case Globals.iphoneSE_hieght1:
            size = 12
        case Globals.iphone8_hieght2:
            size = 12
        case Globals.iphone8Plus_hieght3:
            size = 14
        case Globals.iphoneX_hieght4:
            size = 14
        case Globals.iphone7Plus_hieght5:
            size = 14
        case Globals.iphonePro_hieght6:
            size = 16
        case Globals.iphoneXsMax_hieght7:
            size = 16
        case Globals.iphoneProMax_hieght8:
            size = 16
        default:
            size = 0
        }
        self.font = UIFont(name: Constant.GothamRounded_Book, size: size)
    }
    
}
class GothamRounded_Book14: UILabel {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var size:CGFloat = 0
        let frame = UIScreen.main.bounds
        switch frame.height {
        case Globals.iphoneSE_hieght1:
            size = 10
        case Globals.iphone8_hieght2:
            size = 10
        case Globals.iphone8Plus_hieght3:
            size = 12
        case Globals.iphoneX_hieght4:
            size = 12
        case Globals.iphone7Plus_hieght5:
            size = 12
        case Globals.iphonePro_hieght6:
            size = 14
        case Globals.iphoneXsMax_hieght7:
            size = 14
        case Globals.iphoneProMax_hieght8:
            size = 14
        default:
            size = 0
        }
        self.font = UIFont(name: Constant.GothamRounded_Book, size: size)
    }
}
class GothamRounded_Book12: UILabel {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        var size:CGFloat = 0
        let frame = UIScreen.main.bounds
        switch frame.height {
        case Globals.iphoneSE_hieght1:
            size = 8
        case Globals.iphone8_hieght2:
            size = 8
        case Globals.iphone8Plus_hieght3:
            size = 10
        case Globals.iphoneX_hieght4:
            size = 10
        case Globals.iphone7Plus_hieght5:
            size = 10
        case Globals.iphonePro_hieght6:
            size = 12
        case Globals.iphoneXsMax_hieght7:
            size = 12
        case Globals.iphoneProMax_hieght8:
            size = 12
        default:
            size = 0
        }
        self.font = UIFont(name: Constant.GothamRounded_Book, size: size)
    }
}
