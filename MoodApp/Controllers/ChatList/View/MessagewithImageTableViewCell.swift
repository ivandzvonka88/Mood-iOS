//
//  MessagewithImageTableViewCell.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//

import UIKit

class MessagewithImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblthread: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblvbody: UILabel!
    
    @IBOutlet weak var messageImagesCollection: UICollectionView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
