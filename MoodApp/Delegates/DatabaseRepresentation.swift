//
//  DatabaseRepresentation.swift
//  TradeAir
//
//  Created by Adeel on 10/10/2019.
//  Copyright © 2019 Buzzware. All rights reserved.
//

import UIKit

protocol DatabaseRepresentation {
    var logInRepresentation: [String: String] { get }
    var signUpRepresentation: [String: String] { get }
    
}
enum ModelType:String{
    case userModel
    case MainCategoryModel
    case AddMoresModel
}
