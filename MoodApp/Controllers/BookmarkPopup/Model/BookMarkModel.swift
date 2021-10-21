//
//  BookMarkModel.swift
//  MoodApp
//
//  Created by Buzzware Tech on 01/09/2021.
//

import UIKit

class BookMarkModel:Codable {

    var name:String!
    var tfValue:String!
    var isCat:Bool!
    
    init(name:String? = nil,tfValue:String? = nil,isCat:Bool = false) {
        self.name = name
        self.tfValue = tfValue
        self.isCat = isCat
    }
}
class CategoryModel:Codable {

    var name:String!
    var isSelect:Bool!
    var subCategory:[SubCatModel]!
    init(name:String? = nil,isSelect:Bool = false,subCat:[SubCatModel]) {
        self.name = name
        self.isSelect = isSelect
        self.subCategory = subCat
    }
}
class SubCatModel:Codable {

    var name:String!
    var isSelect:Bool!
    init(name:String? = nil,isSelect:Bool = false) {
        self.name = name
        self.isSelect = isSelect
    }
}
