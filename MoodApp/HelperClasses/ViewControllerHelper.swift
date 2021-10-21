//
//  ViewControllerHelper.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

class ViewControllerHelper {
    static let sharedInstance = ViewControllerHelper() //<- Singleton Instance
    
    private init() { /* Additional instances cannot be created */ }
    
    func isViewControllerAlreadyShowing(_ currentShowingViewController: UIViewController?) -> Bool {
        //////////////////////////////
        // if present view controller
        //////////////////////////////
        if currentShowingViewController?.presentedViewController != nil {
            return true
        }
        if currentShowingViewController?.navigationController?.presentingViewController?.presentedViewController == currentShowingViewController?.navigationController {
            return true
        }
        if (currentShowingViewController?.tabBarController?.presentingViewController is UITabBarController) {
            return true
        }
        return false
        ////////////////////////////////////////////////////////////
    }
    
    func isModal(_ currentViewController: UIViewController?) -> Bool {
        var isPresentedAsModal = false
        if currentViewController?.presentedViewController?.presentingViewController == currentViewController {
            isPresentedAsModal = true
        } else if currentViewController?.navigationController != nil && currentViewController?.navigationController?.presentingViewController?.presentedViewController == currentViewController?.navigationController {
            isPresentedAsModal = true
        } else if (currentViewController?.tabBarController?.presentingViewController is UITabBarController) {
            isPresentedAsModal = true
        }
        return isPresentedAsModal
    }
    
    func removeAnyViewControllers(_ currentViewController: UIViewController?, ofKind kind: AnyClass)
    {
        currentViewController?.navigationController?.viewControllers = (currentViewController?.navigationController?.viewControllers.filter { !$0.isKind(of: kind)})!
    }
    
    /// Given the kind of a (UIViewController subclass),
    /// returns true if self's viewControllers array contains at
    /// least one matching instance.
    
    func containsViewController(_ currentViewController: UIViewController?, ofKind kind: AnyClass) -> Bool
    {
        return (currentViewController?.navigationController?.viewControllers.contains(where: { $0.isKind(of: kind) }))!
    }
    
}
