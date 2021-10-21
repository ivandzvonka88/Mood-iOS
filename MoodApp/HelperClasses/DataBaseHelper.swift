//
//  DataBaseHelper.swift
//  MandiCart
//
//  Created by Adeel on 14/03/2020.
//  Copyright © 2020 Buzzware. All rights reserved.
//

import UIKit
//import SQLite
class DataBaseHelper {

//    static let sharedInstance = DataBaseHelper() //<- Singleton Instance
//    var db : Connection!
//    var isFirstTime : Bool = false
//    let card = Table(Constant.Card)
//    let card_id = Expression<Int64>(Constant.card_id)
//    let user_id = Expression<String>(Constant.user_id)
//    let customer_id = Expression<String>(Constant.customer_id)
//    let card_num = Expression<String>(Constant.card_num)
//    let card_month = Expression<Int64>(Constant.card_month)
//    let card_year = Expression<Int64>(Constant.card_year)
//    let card_cvv = Expression<Int64>(Constant.card_cvv)
//    let card_postcode = Expression<String>(Constant.card_postcode)
//    let card_sid = Expression<String>(Constant.card_sid)
//    
//       private init() {
//        do{
//            let name = CommonHelper.sharedInstance.getDirectoryPath()
//            db = try Connection(name)
//            if !isFirstTime{
//                creatTable()
//                isFirstTime = true
//            }
//            
//        }
//        catch{
//            debugPrint(error)
//        }
//        
//        /* Additional instances cannot be created */ }
//    
//    func creatTable(){
//    
//        do{
//            try db.run(card.create(block: { (t) in
//                t.column(card_id, primaryKey: true)
//                t.column(card_sid, unique: true)
//                t.column(user_id)
//                t.column(customer_id)
//                t.column(card_num, unique: true)
//                t.column(card_month)
//                t.column(card_year)
//                t.column(card_cvv)
//                t.column(card_postcode)
//                
//            }))
//        }
//        catch{
//            debugPrint(error)
//        }
//        
//    }
//    func saveToCard(data:cardModel) -> Bool{
//        
//        var suces = false
//        do{
//            try db.run(card.insert(card_id <- Int64(Date().milisecond),user_id <- data.userId!,customer_id <- data.cardCustomerId,card_num <- data.cardNumber!,card_month <- data.cardMonth!,card_year <- data.cardYear!,card_cvv <- data.cardCVV!,card_postcode <- data.cardPostcode!,card_sid <- data.cardStripeId!))
//            suces = true
//        }
//        catch{
//            debugPrint(error)
//            suces = false
//            
//        }
//        return suces
//    }
//    
//    func getAllCard(userid: String)->[cardModel]{
//        var array = [cardModel]()
//        do{
//            
//            for result in try db.prepare(card.select(user_id,customer_id,card_num,card_month,card_year,card_cvv,card_postcode,card_sid).where(user_id == userid)){
//                
//                array.append(cardModel(userid: try result.get(user_id),card_num: try result.get(card_num), card_mnth: try result.get(card_month), card_yrs: try result.get(card_year), card_cvv: try result.get(card_cvv), postcode: try result.get(card_postcode), card_sid: try result.get(card_sid),cus_id: try result.get(customer_id)))
//            }
//            return array
//        }
//        catch{
//            debugPrint(error)
//            return array
//        }
//        
//    }
////    func deleteAllCart(array: [dataModel]) -> Bool{
////        var suces = false
////        for data in array{
////            do{
////                let rid = cart.filter(id == data.id!)
////                try db.run(rid.delete())
////                suces = true
////            }
////            catch{
////                debugPrint(error)
////                suces = false
////            }
////        }
////        return suces
////    }
//    func deleteCard(data: SCardModel) -> Bool{
//        var suces = false
//        do{
//            let card_id = card.filter(card_sid == data.cardId!)
//            try db.run(card_id.delete())
//            suces = true
//        }
//        catch{
//            debugPrint(error)
//            suces = false
//        }
//        return suces
//    }
////    func updateCart(data: dataModel) -> Bool{
////        var suces = false
////        do{
////            let rid = cart.filter(id == data.id!)
////            try db.run(rid.update(cartPrice <- data.cartPrice,cartKg <- data.cart))
////            suces = true
////        }
////        catch{
////            debugPrint(error)
////            suces = false
////        }
////        return suces
////    }
}
