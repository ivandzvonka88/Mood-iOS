//
//  UserNameViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class UserNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func nextBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toPassword", sender: nil)
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
