//
//  popActivityTableViewCell.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//

import UIKit

class popActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var checkicon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
