//
//  subcatTableViewCell.swift
//  MoodApp
//
//  Created by Buzzware Tech on 03/09/2021.
//

import UIKit

class subcatTableViewCell: UITableViewCell {

    @IBOutlet weak var subcollectionview: UICollectionView!
    
    @IBOutlet weak var celllbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
