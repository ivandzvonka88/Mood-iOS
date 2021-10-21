//
//  SettingsModel.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import Foundation

struct SettingsModel {
    var name: String!
    var Entities: [EntityModel]!
    init(name:String , entities: [EntityModel]) {
        self.name = name
        self.Entities = entities
    }
}

struct EntityModel {
    var title: String!
    var image_name: String!
    var helping_title: String!
//    init(title:String,image_name:String,helping_title:String) {
//        self.title = title
//        self.image_name = image_name
//        self.helping_title = helping_title
//    }
}
