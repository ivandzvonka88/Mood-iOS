//
//  ViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit
import ESTabBarController_swift
import pop
import ChameleonFramework
import Lottie
class ViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.loadTabbar()
        
    }
    func loadTabbar(){
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = UIColor().colorsFromAsset(name: .bgColor)
        self.delegate = delegate
//        let blurEffect = UIBlurEffect(style: .dark)
//        let effeect = UIVisualEffectView(frame: self.tabBar.frame)
//        effeect.effect = blurEffect
//        self.tabBar.addSubview(effeect)
        self.tabBar.drawCorner(roundTo: .top)
        for (index,controller) in self.viewControllers!.enumerated(){
            switch index {
            case 0:
                controller.tabBarItem =  ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: #imageLiteral(resourceName: "Home"), selectedImage: #imageLiteral(resourceName: "Home"))
            case 1:
                controller.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Popular", image: #imageLiteral(resourceName: "Search"), selectedImage: #imageLiteral(resourceName: "Search000"))
            case 2:
                controller.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: #imageLiteral(resourceName: "Group 685"), selectedImage: #imageLiteral(resourceName: "Group 685"))
            case 3:
                controller.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Activity", image: #imageLiteral(resourceName: "Star"), selectedImage: #imageLiteral(resourceName: "Starererr"))
            case 4:
                controller.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Profile", image: #imageLiteral(resourceName: "Iconc"), selectedImage: #imageLiteral(resourceName: "Usercvv"))
            default:
                break
            }
        }
        self.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        self.didHijackHandler = {
             tabbarController, viewController, index in
            
            let controller = self.storyboard?.instantiateViewController(identifier: "MakeVideoViewController") as! UINavigationController
            if let controler = controller.children.first as? MakeVideoViewController{
                
            }
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            self.present(controller, animated: true)
            //self.allreportApi()
        }
    }

}

class ExampleBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
class ExampleBouncesContentView: ExampleBasicContentView {

    public var duration = 0.3

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }

    override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        self.bounceAnimation()
        completion?()
    }
    
    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}
class ExampleIrregularityBasicContentView: ExampleBouncesContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textColor = .white
        highlightTextColor = UIColor().colorsFromAsset(name: .yellowColor)
        iconColor = .white
        highlightIconColor = UIColor().colorsFromAsset(name: .yellowColor)
        backdropColor = .clear
        highlightBackdropColor = .clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class ExampleIrregularityContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self.imageView.backgroundColor = .orange
        //self.imageView.layer.borderWidth = 3.0
        //self.imageView.layer.borderColor = UIColor.init(white: 235 / 255.0, alpha: 1.0).cgColor
        //self.imageView.layer.cornerRadius = 35
        self.insets = UIEdgeInsets.init(top: -10, left: 0, bottom: 0, right: 0)
        let transform = CGAffineTransform.identity
        //self.imageView.backgroundColor = UIColor(gradientStyle: .radial, withFrame: CGRect(x: 0, y: 0, width: 50, height: 50), andColors: [UIColor.white,UIColor.clear])
        
        self.imageView.transform = transform
        self.superview?.bringSubviewToFront(self)

        textColor = .clear
        highlightTextColor = .clear
        iconColor = UIColor().colorsFromAsset(name: .yellowColor)
        highlightIconColor = UIColor().colorsFromAsset(name: .yellowColor)
        backdropColor = .clear
        highlightBackdropColor = .clear
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let p = CGPoint.init(x: point.x - imageView.frame.origin.x, y: point.y - imageView.frame.origin.y)
        return sqrt(pow(imageView.bounds.size.width / 2.0 - p.x, 2) + pow(imageView.bounds.size.height / 2.0 - p.y, 2)) < imageView.bounds.size.width / 2.0
    }
    
    override func updateLayout() {
        super.updateLayout()
        self.imageView.sizeToFit()
        self.imageView.center = CGPoint.init(x: self.bounds.size.width / 2.0, y: self.bounds.size.height / 2.0)
        //let view = UIView(frame: CGRect(x: 20, y: 20, width: 20, height: 20))
        //view.backgroundColor = .white
        //view.center = self.center
        //let layer = CALayer()
        //layer.backgroundColor = UIColor.white.cgColor
        //layer.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        //self.imageView.layer.addSublayer(layer)
        self.imageView.image = #imageLiteral(resourceName: "Group 685")
        //self.imageView.layer.createPolygone(CGRect(origin: .zero, size: CGSize(width: 80, height: 80)), lineWidth: 5, sides: 6)
        //self.imageView.layer.createImageInPolygone(CGRect(origin: .zero, size: CGSize(width: 80, height: 80)), image: #imageLiteral(resourceName: "ic_tab4"))
    }
    
    public override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        let view = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize(width: 2.0, height: 2.0)))
        view.layer.cornerRadius = 1.0
        view.layer.opacity = 0.5
        view.backgroundColor = .clear
        self.addSubview(view)
        playMaskAnimation(animateView: view, target: self.imageView, completion: {
            [weak view] in
            view?.removeFromSuperview()
            completion?()
        })
    }
    
    public override func reselectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    public override func deselectAnimation(animated: Bool, completion: (() -> ())?) {
        completion?()
    }
    
    public override func highlightAnimation(animated: Bool, completion: (() -> ())?) {
        
        UIView.beginAnimations("small", context: nil)
        UIView.setAnimationDuration(0.2)
        let transform = self.imageView.transform.scaledBy(x: 0.8, y: 0.8)
        self.imageView.transform = transform
        
        UIView.commitAnimations()
        completion?()
    }
    
    public override func dehighlightAnimation(animated: Bool, completion: (() -> ())?) {
        UIView.beginAnimations("big", context: nil)
        UIView.setAnimationDuration(0.2)
        let transform = CGAffineTransform.identity
        self.imageView.transform = transform
        UIView.commitAnimations()
        completion?()
    }
    
    private func playMaskAnimation(animateView view: UIView, target: UIView, completion: (() -> ())?) {
        view.center = CGPoint.init(x: target.frame.origin.x + target.frame.size.width / 2.0, y: target.frame.origin.y + target.frame.size.height / 2.0)
        
        let scale = POPBasicAnimation.init(propertyNamed: kPOPLayerScaleXY)
        scale?.fromValue = NSValue.init(cgSize: CGSize.init(width: 1.0, height: 1.0))
        scale?.toValue = NSValue.init(cgSize: CGSize.init(width: 36.0, height: 36.0))
        scale?.beginTime = CACurrentMediaTime()
        scale?.duration = 0.3
        scale?.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeOut)
        scale?.removedOnCompletion = true
        
        let alpha = POPBasicAnimation.init(propertyNamed: kPOPLayerOpacity)
        alpha?.fromValue = 0.6
        alpha?.toValue = 0.6
        alpha?.beginTime = CACurrentMediaTime()
        alpha?.duration = 0.25
        alpha?.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeOut)
        alpha?.removedOnCompletion = true
        
        view.layer.pop_add(scale, forKey: "scale")
        view.layer.pop_add(alpha, forKey: "alpha")
        
        scale?.completionBlock = ({ animation, finished in
            completion?()
        })
    }
    

}
class ExampleLottieAnimateBasicContentView: ESTabBarItemContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.init(red: 61/255.0, green: 206/255.0, blue: 193/255.0, alpha: 1.0)
        highlightTextColor = UIColor.init(red: 252/255.0, green: 13/255.0, blue: 27/255.0, alpha: 1.0)
        iconColor = UIColor.init(red: 61/255.0, green: 206/255.0, blue: 193/255.0, alpha: 1.0)
        highlightIconColor = UIColor.init(red: 252/255.0, green: 13/255.0, blue: 27/255.0, alpha: 1.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

import Lottie
class ExampleLottieAnimateContentView: ExampleLottieAnimateBasicContentView {

    let lottieView: AnimationView! = {
        let lottieView = AnimationView(name:"IconTransitions")
        lottieView.loopMode = .loop
        lottieView.contentMode = .scaleAspectFit
        lottieView.play()
        return lottieView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(lottieView)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateLayout() {
        super.updateLayout()
        lottieView.frame = self.bounds.insetBy(dx: -2, dy: -2)
    }
    
    override func selectAnimation(animated: Bool, completion: (() -> ())?) {
        super.selectAnimation(animated: animated, completion: nil)
        lottieView.pause()
    }
    
    override func deselectAnimation(animated: Bool, completion: (() -> ())?) {
        super.deselectAnimation(animated: animated, completion: nil)
        lottieView.play()
    }

}
