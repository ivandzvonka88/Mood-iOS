//
//  HomeCollectionViewCell.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import Cosmos
class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var ivImage:UIImageView!
    @IBOutlet weak var ratingView:CosmosView!
    @IBOutlet weak var vHot:UIView!
}
