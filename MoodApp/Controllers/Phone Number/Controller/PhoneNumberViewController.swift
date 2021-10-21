//
//  PhoneNumberViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit
import FlagPhoneNumber

class PhoneNumberViewController: UIViewController {
    
    
    @IBOutlet weak var tfPhone:FPNTextField!
    var delegate = SignInOptionViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func sendCodeBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toVerify", sender: nil)
    }
    
}

//MARK:- HELPING METHOD'S
extension PhoneNumberViewController{
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
}

//MARK:- UITEXTVIEW DELEGATES METHOD'S
extension PhoneNumberViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text!
        if text.count > 0{
            //self.SendCodeBtn.backgroundColor = UIColor(named: "Text 2")
            //self.SendCodeBtn.titleLabel?.textColor = UIColor(named: "Text")
        }
        return true
    }
}
