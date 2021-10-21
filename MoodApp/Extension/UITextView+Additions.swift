//
//  UITextView+Additions.swift
//  TastyBox
//
//  Created by Adeel on 25/06/2020.
//  Copyright © 2020 Buzzware. All rights reserved.
//

import UIKit

class UITextView_Additions: UITextView {

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      textContainerInset = UIEdgeInsets(top: 8, left: 10, bottom: 0, right: 10)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
