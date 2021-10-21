//
//  SignInOptionViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class SignInOptionViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    @IBAction func signupNormal(_ sender:Any){
        self.performSegue(withIdentifier: "toRegister", sender: nil)
    }
    @IBAction func signinGoogle(_ sender:Any){
        
    }
    @IBAction func signinApple(_ sender:Any){
        
    }
    @IBAction func signinFacebook(_ sender:Any){
        
    }
    @IBAction func signinTwitter(_ sender:Any){
        
    }
    @IBAction func signinNormal(_ sender:Any){
        self.performSegue(withIdentifier: "toSignin", sender: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let controller = segue.destination as? SignupPhoneViewController{
            controller.delegate = self
        }
        if let controller = segue.destination as? SignInPhoneViewController{
            controller.delegate = self
        }
    }
    

}
