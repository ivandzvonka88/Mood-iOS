//
//  PlayerCollectionViewCell.swift
//  MoodApp
//
//  Created by Buzzware Tech on 27/07/2021.
//

import UIKit
import Cosmos
class PlayerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblConst: NSLayoutConstraint!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblVideoName: UILabel!
    @IBOutlet weak var vRating: CosmosView!
    @IBOutlet weak var lblSongName: UILabel!
    @IBOutlet weak var videoView: UIImageView!
}
