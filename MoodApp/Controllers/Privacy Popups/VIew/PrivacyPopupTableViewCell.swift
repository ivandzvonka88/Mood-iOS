//
//  PrivacyPopupTableViewCell.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class PrivacyPopupTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var CheckMark: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
