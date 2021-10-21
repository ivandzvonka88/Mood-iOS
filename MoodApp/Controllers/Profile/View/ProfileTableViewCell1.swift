//
//  ProfileTableViewCell1.swift
//  MoodApp
//
//  Created by Buzzware Tech on 16/07/2021.
//

import UIKit

class ProfileTableViewCell1: UITableViewCell {

    @IBOutlet weak var btnMyVideo: UIButton!
    @IBOutlet weak var btnLikeVideo: UIButton!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
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
        
        self.homeCollectionView?.collectionViewLayout = layout
    }

}
