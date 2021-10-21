//
//  SettingsTableViewCell.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var SettingImage: UIImageView!
    @IBOutlet weak var SettingTitle: UILabel!
    @IBOutlet weak var SettingHelpingTitle: UILabel!
    @IBOutlet weak var ForwordImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
