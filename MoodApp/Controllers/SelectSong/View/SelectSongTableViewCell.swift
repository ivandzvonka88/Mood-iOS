//
//  SelectSongTableViewCell.swift
//  MoodApp
//
//  Created by Buzzware Tech on 14/07/2021.
//

import UIKit

class SelectSongTableViewCell: UITableViewCell {

    @IBOutlet weak var imageAlbum: UIImageView!

    @IBOutlet weak var lblsongname: UILabel!
    
    @IBOutlet weak var lblsingerName: UILabel!
    
    @IBOutlet weak var lblcount: UILabel!
    
    @IBOutlet weak var ivSelected: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
