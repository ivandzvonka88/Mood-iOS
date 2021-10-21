//
//  SignInPhoneViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit
import PhoneNumberKit
class SignInPhoneViewController: UITableViewController {

    @IBOutlet weak var sSegement:UISegmentedControl!
    @IBOutlet weak var tfPhone:PhoneNumberTextField!
    @IBOutlet weak var tfPassword:UITexfield_Additions!
    var delegate = SignInOptionViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.sSegement.selectedSegmentIndex = 0
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func signinBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toHome", sender: nil)
    }
    @IBAction func segmentValueChanged(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 1{
            self.performSegue(withIdentifier: "toEmail", sender: nil)
        }
        
    }
    @IBAction func forgotBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toForgot", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let controller = segue.destination as? SignInEmailViewController{
            controller.delegate = self.delegate
        }
    }

}
