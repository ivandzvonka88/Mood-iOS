//
//  EmailViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class EmailViewController: UIViewController {

    //IBOUTLET'S
    @IBOutlet weak var PhoneNumberTF: UITexfield_Additions!
    @IBOutlet weak var SendCodeBtn: UIButton!
    
    //VARIABEL'S
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func SendCodeBtnAction(_ sender: Any) {
        let verificationCode = self.getViewController(identifier: "EmailVerificationViewController") as! EmailVerificationViewController
        self.navigationController?.pushViewController(verificationCode, animated: true)
    }
    
}

//MARK:- HELPING METHOD'S
extension EmailViewController{
    
    
    
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
    
}
