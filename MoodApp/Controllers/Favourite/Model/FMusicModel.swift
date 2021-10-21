//
//  FMusicModel.swift
//  MoodApp
//
//  Created by Buzzware Tech on 17/07/2021.
//

import UIKit

class FMusicModel {

    var music:String!
    var name:String!
    var singer:String!
    var duration:String!
    var isSelected:Bool!
    
    
    init(music: String,name:String,singer: String,duration:String,isSelected:Bool = false) {
        self.music = music
        self.name = name
        self.singer = singer
        self.duration = duration
        self.isSelected = isSelected
        
    }
}
