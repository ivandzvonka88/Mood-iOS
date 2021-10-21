//
//  bookeditTableViewCell.swift
//  MoodApp
//
//  Created by Macbook Air on 9/2/21.
//

import UIKit

class bookeditTableViewCell: UITableViewCell {

    @IBOutlet weak var btnsection: UIButton!
    @IBOutlet weak var lblhashtag: UILabel!
    @IBOutlet weak var imagehot: UIImageView!
    @IBOutlet weak var lblsectionbutton: UILabel!
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    
    @IBOutlet weak var deletebtn: UIButton!
    @IBOutlet weak var editbtn: UIButton!
    @IBOutlet weak var messagebtn: UIButton!
    @IBOutlet weak var sharebn: UIButton!
    
    
    
    @IBOutlet weak var popluarcollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionViewSetup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        if UIDevice.current.userInterfaceIdiom == .phone{
          layout.sectionInset = UIEdgeInsets(top: spacingIphone, left: spacingIphone, bottom: spacingIphone, right: spacingIphone)
          layout.minimumLineSpacing = spacingIphone
          layout.minimumInteritemSpacing = spacingIphone
        }
        else{
          layout.sectionInset = UIEdgeInsets(top: spacingIpad, left: spacingIpad, bottom: spacingIpad, right: spacingIpad)
          layout.minimumLineSpacing = spacingIpad
          layout.minimumInteritemSpacing = spacingIpad
        }
        layout.scrollDirection = .horizontal
        self.popluarcollection?.collectionViewLayout = layout
      }

}
