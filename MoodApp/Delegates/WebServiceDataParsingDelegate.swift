//
//  WebServiceDataParsingDelegate.swift
//  TradeAir
//
//  Created by Adeel on 08/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

protocol WebServiceDataParsingDelegate: class
{
    func webServiceDataParsingOnResponseReceived(status: Int,
                                                 webServiceTitle: String,
                                                 viewControllerObj: UIViewController,
                                                 swiftyJsonObj:JSON,
                                                 dataDict: Dictionary<String, Any>)
    
}
