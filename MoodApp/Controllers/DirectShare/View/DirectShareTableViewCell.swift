//
//  DirectShareTableViewCell.swift
//  MoodApp
//
//  Created by Buzzware Tech on 24/08/2021.
//

import UIKit

class DirectShareTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var ivCheck: UIImageView!
    @IBOutlet weak var ivUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
