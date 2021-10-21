//
//  AppDelegate.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit
import IQKeyboardManagerSwift
//import LGSideMenuController
import GoogleMaps
import GooglePlaces
//import GoogleSignIn
//import FBSDKCoreKit
import FirebaseCore
import FirebaseMessaging
import FirebaseInstallations
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var deviceTokenForPushN = ""
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSPlacesClient.provideAPIKey("AIzaSyAG0cs7O7nA7E9GuscgdwXlH7hwDMLhAxo")
        GMSServices.provideAPIKey("AIzaSyAG0cs7O7nA7E9GuscgdwXlH7hwDMLhAxo")
        //GIDSignIn.sharedInstance().clientID = "350599576201-gv9s2qquotnnlbk0tjfgi9r7v04fo7g0.apps.googleusercontent.com"
        FirebaseApp.configure()
//        ApplicationDelegate.shared.application(
//            application,
//            didFinishLaunchingWithOptions: launchOptions
//        )
        let token = Messaging.messaging().fcmToken
        // print ("the token is " , token!)
        print("FCM token: \(token ?? "")")
        deviceTokenForPushN = (" \(token ?? "")")
        print("FCM deviceTokenForPushN: \(deviceTokenForPushN )")
        UserDefaults.standard.set(deviceTokenForPushN, forKey: Constant.token_id)
        UserDefaults.standard.synchronize()
        UIApplication.shared.applicationIconBadgeNumber = 0
        UNUserNotificationCenter.current().delegate = self
        registerForPushNotifications()
        
        IQKeyboardManager.shared.enable = true
        Thread.sleep(forTimeInterval: 2.0)
        return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        Messaging.messaging().apnsToken = deviceToken
        print ("ashdgjasjda" ,  deviceToken )
        print("Device Token: \(token)")
    }
    func application(_ application: UIApplication,didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }
    func registerForPushNotifications() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge,.announcement]) { [weak self] granted, error in
                print("Permission granted: \(granted)")
                guard granted else { return }
                self?.getNotificationSettings()
            }
    }
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
                NotificationCenter.default.addObserver(self, selector: #selector(self.refreshToken(notification:)) , name: .MessagingRegistrationTokenRefreshed, object: nil)
            }
        }
    }
    @objc func refreshToken(notification : NSNotification) {
        Installations.installations().installationID { (result, error) in
            if let error = error {
                print("Error fetching remote instange ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result)")
            }
        }
        
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension UIApplication{
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

            if let nav = base as? UINavigationController {
                return getTopViewController(base: nav.visibleViewController)

            } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
                return getTopViewController(base: selected)

            } else if let presented = base?.presentedViewController {
                return getTopViewController(base: presented)
            }
            return base
        }
}
extension AppDelegate:UNUserNotificationCenterDelegate{
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        if notification.request.identifier == "Local Notification Order" {
            print("Handling notifications with the Local Notification Identifier")
            center.removeDeliveredNotifications(withIdentifiers: [notification.request.identifier])
            center.removePendingNotificationRequests(withIdentifiers: [notification.request.identifier])
            
            
        }
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        let userInfo = notification.request.content.userInfo
        
        print ("the user info is " , userInfo )
        if let message_type = userInfo["transaction_type"] as? String{
            switch message_type {
            case "redeem":
                NotificationCenter.default.post(name: .transection, object: nil, userInfo: userInfo)
            case "issue":
                NotificationCenter.default.post(name: .transection, object: nil, userInfo: userInfo)
            default:
                break
            }
        }
//        if let topVC = UIApplication.getTopViewController() {
//            if !topVC.isKind(of: ChatViewController.self){
//                completionHandler(UNNotificationPresentationOptions([.badge,.banner,.sound,.list]))
//            }
//            
//        }
        
        //            let str = String(describing: userInfo)
        //
        //            let arr = str.components(separatedBy: ",")
        //
        //        let arr2 = arr.filter { (val) -> Bool in
        //            return val.contains("status")
        //        }
        //        if arr2.count > 0{
        //            let arr3 = arr2[0].components(separatedBy: ":")
        //            print("the arr2 is" , arr3)
        //            let type = arr3.last
        //
        //            print("the type is" , type!)
        //
        //            let typ = type?.replacingOccurrences(of: " ", with: "")
        //            if typ == "1"{
        //                self.userNotify()
        //                //self.timer =  Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(userNotify), userInfo: nil, repeats: true)
        //
        //            }
        //        }
        
        
        
        
        
        
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "Local Notification Order" {
            print("Handling notifications with the Local Notification Identifier")
            center.removeDeliveredNotifications(withIdentifiers: [response.notification.request.identifier])
            UIApplication.shared.applicationIconBadgeNumber = 0
            completionHandler()
            
        }
        
    }
    
    @objc func userNotify(){
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
                return
            }
        }
        notificationCenter.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                // Notifications not allowed
                return
            }
        }
        let content = UNMutableNotificationContent() // Содержимое уведомления
        
        content.title = "TastyBox"
        content.body = "Your Order Ready please collect it now"
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        
        let date = Date(timeIntervalSinceNow: 1800)
        let triggerHourly = Calendar.current.dateComponents([.second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerHourly, repeats: true)
        
        let identifier = "Local Notification Order"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        notificationCenter.delegate = self
        
    }
}
