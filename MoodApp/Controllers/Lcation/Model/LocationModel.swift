//
//  LocationModel.swift
//  DF1
//
//  Created by Buzzware Tech on 04/03/2021.
//

import UIKit

class LocationModel:Codable {

    var address_name:String!
    var address:String!
    var street_address_1:String!
    var street_address_2:String!
    var zipcode:String!
    var city:String!
    var state_id:Int64!
    var country_id:Int64!
    var address_lat:Double!
    var address_lng:Double!
    init(address_name:String? = nil,address:String? = nil,street_address_1:String? = nil,street_address_2:String? = nil,zipcode:String? = nil,city:String? = nil,state_id:Int64? = nil,country_id:Int64? = nil,address_lat:Double? = nil,address_lng:Double? = nil) {
        self.address_name = address_name
        self.address = address
        self.street_address_1 = street_address_1
        self.street_address_2 = street_address_2
        self.zipcode = zipcode
        self.city = city
        self.state_id = state_id
        self.country_id = country_id
        self.address_lat = address_lat
        self.address_lng = address_lng
    }
    init?(dic:NSDictionary) {
        
        
        let address_name = (dic as AnyObject).value(forKey: Constant.address_name) as? String
        let address = (dic as AnyObject).value(forKey: Constant.address) as? String
        let address_lat = (dic as AnyObject).value(forKey: Constant.address_lat) as? Double
        let address_lng = (dic as AnyObject).value(forKey: Constant.address_lng) as? Double
        
        
        
        self.address_name = address_name
        self.address = address
        self.address_lat = address_lat
        self.address_lng = address_lng
        
    }
    
}
