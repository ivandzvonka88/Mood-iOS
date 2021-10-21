//
//  NotificationTableViewCell.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    //IBOUTLET'S
    @IBOutlet weak var NotificationLabel: UILabel!
    @IBOutlet weak var NotificationSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
