//
//  PopularModel.swift
//  MoodApp
//
//  Created by Buzzware Tech on 17/07/2021.
//

import UIKit

class PopularModel {

    var popularVideo:PVideoModel!
    var hashtag:HashtagModel!
    
    
    init(popularVideo: PVideoModel,hashtag:HashtagModel) {
        self.popularVideo = popularVideo
        self.hashtag = hashtag
        
    }
}
class PopularModel2 {

    var popularVideo:[PVideoModel]!
    var val:String!
    
    
    init(popularVideo: [PVideoModel],val:String) {
        self.popularVideo = popularVideo
        self.val = val
       
        
    }
}
