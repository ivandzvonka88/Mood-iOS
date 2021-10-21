//
//  SignInEmailViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class SignInEmailViewController: UITableViewController {

    @IBOutlet weak var sSegement:UISegmentedControl!
    @IBOutlet weak var tfEmail:UITexfield_Additions!
    @IBOutlet weak var tfPassword:UITexfield_Additions!
    var delegate = SignInOptionViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.sSegement.selectedSegmentIndex = 1
    }
    @IBAction func loginBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toHome", sender: nil)
    }
    @IBAction func segmentValueChanged(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    @IBAction func backBtnPressed(_ sender:Any){
        self.gotoBacks()
    }
    func gotoBacks(){
        self.navigationController?.popToViewController(delegate, animated: true)
    }
    @IBAction func forgotBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toForgot", sender: nil)
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
