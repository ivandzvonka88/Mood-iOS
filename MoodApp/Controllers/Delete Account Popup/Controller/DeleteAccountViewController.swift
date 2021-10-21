//
//  DeleteAccountViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class DeleteAccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func YesBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func NoBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
