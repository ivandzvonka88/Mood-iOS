//
//  UIButton+Additions.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class UIButton_Additions: NSObject {

}
class BGothamRounded_Book16: UIButton {

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
        self.titleLabel!.font = UIFont(name: Constant.GothamRounded_Book, size: size)
    }
    
}
class BGothamRounded_Book14: UIButton {

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
        self.titleLabel?.font = UIFont(name: Constant.GothamRounded_Book, size: size)
    }
}
class BGothamRounded_Book12: UIButton {

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
        self.titleLabel?.font = UIFont(name: Constant.GothamRounded_Book, size: size)
    }
}

extension UIButton {
    enum iconPosition {
        case center,left,right
    }
    
    enum arrowDirection {
        case up,down,linear,left,right,check,uncheck,dot
    }
    
    func drawLine(iconPosition position: iconPosition, direction:arrowDirection) {
        switch position {
        case .center:
            let center = self.center
            let fromPoint = CGPoint(x: center.x - 20, y: center.y)
            let toPoint = CGPoint(x: center.x + 20, y: center.y)
            self.drawLine(onLayer: self.layer, fromPoint: fromPoint, toPoint: toPoint, arrowDirection: direction)
        case .left:
            break
        case .right:
            break
            
        }
    }
    
    fileprivate func drawLine(onLayer layer: CALayer, fromPoint start: CGPoint, toPoint end: CGPoint, arrowDirection direction: arrowDirection) {
        let startPoint = start
        let center = self.center
        var lineCenter = CGPoint()
        switch direction {
        case .up:
            if layer.sublayers!.count > 0 {
                for lay in layer.sublayers! {
                    lay.removeFromSuperlayer()
                }
            }
            lineCenter = CGPoint(x: center.x, y: start.y - 8)
        case .down:
            if layer.sublayers == nil {
                lineCenter = CGPoint(x: center.x, y: start.y + 8)
                break }
            for lay in layer.sublayers! {
                lay.removeFromSuperlayer()
            }
            lineCenter = CGPoint(x: center.x, y: start.y + 8)
        case .linear:
            for lay in layer.sublayers! {
                lay.removeFromSuperlayer()
            }
            lineCenter = center
        case .left:
            break
        case .right:
            break
        case .check:
            break
        case .uncheck:
            break
        case .dot:
            break
            
        }
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: startPoint)
        linePath.addLine(to: lineCenter)
        linePath.move(to: lineCenter)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.lineWidth = 5
        line.lineCap = CAShapeLayerLineCap.round
        line.lineJoin = CAShapeLayerLineJoin.round
        line.fillColor = UIColor.red.cgColor
        line.opacity = 1.0
        line.strokeColor = UIColor.red.cgColor
        layer.addSublayer(line)
    }
    
}
