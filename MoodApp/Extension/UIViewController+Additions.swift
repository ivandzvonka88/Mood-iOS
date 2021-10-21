//
//  UIViewController+Additions.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit
import PhotosUI
import LGSideMenuController
//import JGProgressHUD
class UIViewController_Additions: NSObject {

}

extension UIViewController {
    
    @IBAction func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dismissVCAction() {
        self.dismiss(animated: true) {
            
        }
    }
    func takePhoto(btn:UIButton){
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    print("OKAY")
                } else {
                    print("NOTOKAY")
                }
            })
        }
        checkLibrary(btn: btn)
        checkPermission(btn: btn)
    }
}
extension UIViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate, UNUserNotificationCenterDelegate{
    func displayUploadImageDialog(btnSelected: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        let alertController = UIAlertController(title: "", message: "Upload profile photo?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel action"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true) {() -> Void in }
        })
        alertController.addAction(cancelAction)
        let cameraRollAction = UIAlertAction(title: NSLocalizedString("Open library", comment: "Open library action"), style: .default, handler: {(_ action: UIAlertAction) -> Void in
            if UI_USER_INTERFACE_IDIOM() == .pad {
                OperationQueue.main.addOperation({() -> Void in
                    picker.sourceType = .photoLibrary
                    self.present(picker, animated: true) {() -> Void in }
                })
            }
            else {
                picker.sourceType = .photoLibrary
                self.present(picker, animated: true) {() -> Void in }
            }
        })
        alertController.addAction(cameraRollAction)
        let cameraAction = UIAlertAction(title: NSLocalizedString("Camera", comment: "Camera"), style: .default) { (alertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                if UI_USER_INTERFACE_IDIOM() == .pad {
                    OperationQueue.main.addOperation({() -> Void in
                        picker.sourceType = .camera
                        self.present(picker, animated: true) {() -> Void in }
                    })
                }
                else {
                     
                    picker.sourceType = .camera
                    self.present(picker, animated: true) {() -> Void in }
                }
            }
            else{
                
            }

        }
        alertController.addAction(cameraAction)
        alertController.view.tintColor = .black
        if UIDevice.current.userInterfaceIdiom == .pad{
            alertController.modalPresentationStyle = .popover
            if let popoverPresentationController = alertController.popoverPresentationController {
             
                popoverPresentationController.permittedArrowDirections = .left
                popoverPresentationController.sourceView = btnSelected
                alertController.preferredContentSize = CGSize(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/9)
                popoverPresentationController.sourceRect = btnSelected.frame
            }
        }
        present(alertController, animated: true) {() -> Void in }
    }

    

//    func checkLocationPermission() -> Bool{
//        let authStatus = CLLocationManager.authorizationStatus()
//        switch authStatus {
//            
//        case .authorizedWhenInUse, .authorizedAlways:
//            return true
//        case .denied:
//            print("Error")
//            let manag = CLLocationManager()
//            manag.requestLocation()
//            
//            return false
//        default:
//            return false
//        }
//    }
    func checkPermission(btn: UIButton) {
        let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch authStatus {
        case .authorized:
            self.displayUploadImageDialog(btnSelected: btn)
        case .denied:
            print("Error")
        default:
            break
        }
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }


    func checkLibrary(btn:UIButton) {
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .authorized {
            switch photos {
            case .authorized:
                self.displayUploadImageDialog(btnSelected: btn)
            case .denied:
                print("Error")
            default:
                break
            }
        }
    }
}

extension UIViewController{
//    func showHUDView(hudIV: hudIndicatorView,text: hudText,completion: ((JGProgressHUD)->())? = nil){
//        let hud = JGProgressHUD()
//        
//        hud.interactionType = .blockAllTouches
//        hud.animation = JGProgressHUDFadeZoomAnimation.init()
//        switch hudIV {
//        case .indeterminate:
//            hud.indicatorView = JGProgressHUDIndeterminateIndicatorView.init()
//        case .success:
//            hud.indicatorView = JGProgressHUDSuccessIndicatorView.init()
//        case .pie:
//            hud.indicatorView = JGProgressHUDPieIndicatorView.init()
//        case .error:
//            hud.indicatorView = JGProgressHUDErrorIndicatorView.init()
//        case .image:
//            hud.indicatorView = JGProgressHUDImageIndicatorView.init()
//        case .ring:
//            hud.indicatorView = JGProgressHUDRingIndicatorView.init()
//        }
//        
//        switch text {
//        case .load:
//            hud.textLabel.text = text.rawValue
//        case .process:
//            hud.textLabel.text = text.rawValue
//        case .complete:
//            hud.textLabel.text = text.rawValue
//        case .success:
//            hud.textLabel.text = text.rawValue
//        case .error:
//            hud.textLabel.text = text.rawValue
//        case .evaluating:
//            hud.textLabel.text = text.rawValue
//        }
//        
//        completion?(hud)
//        
//        
//    }
    func imagetoString(image:UIImage) -> String{
        let data = image.pngData()
        let str = data!.base64EncodedString()
        return str
    }
    func rationalApproximationOf(x0 : Double, withPrecision eps : Double = 1.0E-6) -> Rational {
        var x = x0
        var a = floor(x)
        var (h1, k1, h, k) = (1, 0, Int(a), 1)
        
        while x - a > eps * Double(k) * Double(k) {
            x = 1.0/(x - a)
            a = floor(x)
            (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
        }
        return (h, k)
    }
    func fractionMutableAttributedString(for string: String,  color:UIColor, size: CGFloat, weight: UIFont.Weight) -> NSAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: color, .font: UIFont.systemFont(ofSize: size, weight: weight)]
        //let str = string.replacingOccurrences(of: " ", with: " ", options: .literal, range: string.range(of: " kg"))
        let attributedText = NSMutableAttributedString(string: string, attributes: attributes)
        
        let substring = string.split(separator: " ") // Do we have a fractional value?
        if substring[0].contains("/") {
            let range = (string as NSString).range(of: String(substring[0]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.fractionFont(ofSize: size,weight: weight), range: range)
        }
        else if substring[1].contains("/"){
            let range = (string as NSString).range(of: String(substring[1]))
            //let simpletext = attributedText.string.replacingOccurrences(of: " ", with: "")
            //attributedText = NSMutableAttributedString(string: simpletext, attributes: attributes )
            attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.fractionFont(ofSize: size,weight: weight), range: range)
        }
        
        
        return attributedText
        
    }
    func getDirectoryPath(isImage:Bool = false) -> String {
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var documentsDirectory = paths[0] as String
        if isImage{
            
            documentsDirectory = (paths[0] as NSString).appendingPathComponent("Images") as String
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: documentsDirectory){
                return documentsDirectory
            }
            else{
                do{
                    try fileManager.createDirectory(atPath: documentsDirectory, withIntermediateDirectories: true, attributes: nil)
                    return documentsDirectory
                }
                catch{
                    print(error)
                    return ""
                }
            }
        }
        else{
            
            return documentsDirectory
        }
        
    }
    
}
extension UIViewController {
    
    @IBAction func tabHomeBtnPressed(_ sender:Any){
        
        let viewController =  self.storyboard!.instantiateViewController(identifier: "HomeViewController") as? UINavigationController
        
        self.sideMenuController?.rootViewController = viewController

        
    }
    @IBAction func tabPopularBtnPressed(_ sender:Any){
        
        let viewController =  self.storyboard!.instantiateViewController(identifier: "popularViewController") as? UINavigationController
        self.sideMenuController?.rootViewController = viewController
        
    }
    @IBAction func tabVideoBtnPressed(_ sender:Any){
        
        let viewController =  self.storyboard!.instantiateViewController(identifier: "MakeVideoViewController") as! UINavigationController
        viewController.modalTransitionStyle = .flipHorizontal
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    @IBAction func tabActivityBtnPressed(_ sender:Any){
        
        let viewController =  self.storyboard!.instantiateViewController(identifier: "ActivitesViewController") as? UINavigationController
        self.sideMenuController?.rootViewController = viewController
        
    }
    @IBAction func tabProfileBtnPressed(_ sender:Any){
        
        let viewController =  self.storyboard!.instantiateViewController(identifier: "ProfileViewController") as? UINavigationController
        self.sideMenuController?.rootViewController = viewController
        
    }
}
