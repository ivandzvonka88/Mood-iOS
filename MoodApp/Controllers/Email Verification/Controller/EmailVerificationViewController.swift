//
//  EmailVerificationViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit
import OTPInputView
class EmailVerificationViewController: UIViewController {

    @IBOutlet weak var tfOtp:OTPInputView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfOtp.delegateOTP = self
        // Do any additional setup after loading the view.
    }
    @IBAction func confirmBtnPressed(_ sender:Any){
        self.navigationController?.popPreviousViewController(2)
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
extension EmailVerificationViewController:OTPViewDelegate{
    func didFinishedEnterOTP(otpNumber: String) {
        
    }
    
    func otpNotValid() {
        
    }
    
    
}
