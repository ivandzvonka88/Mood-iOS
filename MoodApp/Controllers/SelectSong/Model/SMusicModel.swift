//
//  SMusicModel.swift
//  MoodApp
//
//  Created by Buzzware Tech on 17/07/2021.
//

import UIKit

class SMusicModel {

    var music:String!
    var name:String!
    var singer:String!
    var duration:String!
    
    
    init(music: String,name:String,singer: String,duration:String) {
        self.music = music
        self.name = name
        self.singer = singer
        self.duration = duration
        
    }
}
