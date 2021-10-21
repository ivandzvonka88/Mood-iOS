//
//  savedbookmarkViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 04/09/2021.
//

import UIKit

class savedbookmarkViewController: UIViewController {

    @IBOutlet weak var lblbookmark: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btndone(_ sender: Any) {
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
