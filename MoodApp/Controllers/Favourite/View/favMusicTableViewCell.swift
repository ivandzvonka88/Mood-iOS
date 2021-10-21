//
//  favMusicTableViewCell.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//

import UIKit

class favMusicTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageAlbum: UIImageView!

    @IBOutlet weak var lblsongname: UILabel!
    
    @IBOutlet weak var lblsingerName: UILabel!
    
    @IBOutlet weak var lblcount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
