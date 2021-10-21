//
//  WebServiceResponseDelegate.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
//import JGProgressHUD
protocol WebServiceResponseDelegate: class
{
    func webServiceDataParsingOnResponseReceived(
                                                 viewControllerObj: UIViewController?,
                                                 dataDict: Any)
//    func webServiceDataParsingOnResponseReceivedArr(
//    viewControllerObj: UIViewController,
//    dataDict: NSArray)
}
protocol addMoreOptions: class{
    
    //var searchDic: filterDic { get }
    //var searchTrue: Bool {get}
    
    func webServiceAddMoreData(dataDict: Any)
    
}
