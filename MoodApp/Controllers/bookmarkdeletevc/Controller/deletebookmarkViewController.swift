//
//  deletebookmarkViewController.swift
//  MoodApp
//
//  Created by Macbook Air on 9/2/21.
//

import UIKit

class deletebookmarkViewController: UIViewController {

    @IBOutlet weak var messagelbl: UILabel!
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.messagelbl.text = "Are you sure you want to delete '\(name)' bookmark? "
        // Do any additional setup after loading the view.
    }
    
    @IBAction func yesbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func nobtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
