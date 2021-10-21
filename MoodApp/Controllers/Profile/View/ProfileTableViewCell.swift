//
//  ProfileTableViewCell.swift
//  MoodApp
//
//  Created by Buzzware Tech on 16/07/2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var btnFavourite: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
