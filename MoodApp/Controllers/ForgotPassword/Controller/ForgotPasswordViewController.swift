//
//  ForgotPasswordViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var tfEmail:UITexfield_Additions!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendCodeBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toVerify", sender: nil)
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
