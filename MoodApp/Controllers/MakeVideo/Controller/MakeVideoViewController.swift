//
//  MakeVideoViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import SemiModalViewController
class MakeVideoViewController: UIViewController {

    @IBOutlet weak var optionsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.optionsView.drawCorner(roundTo: .left)
    }

    @IBAction func musicBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toMusic", sender: nil)
    }
    @IBAction func speedBtnPressed(_ sender:Any){
        self.gotoController(0)
    }
    @IBAction func filterBtnPressed(_ sender:Any){
        self.gotoController(1)
    }
    @IBAction func timerBtnPressed(_ sender:Any){
        self.gotoController(2)
    }
    @IBAction func durationBtnPressed(_ sender:Any){
        self.gotoController(3)
    }
    func gotoController(_ val:Int){
        let options: [SemiModalOption : Any] = [
            SemiModalOption.pushParentBack: false
        ]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: "CameraPopup")
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! CameraPopup
        controller.selectedType = val
        controller.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.view.frame.height/4)
        controller.view.cornerRadius = 30
        controller.view.drawCorner(roundTo: .top)
        
        
        presentSemiViewController(controller, options: options, completion: {
            print("Completed!")
        }, dismissBlock: {
            print("Dismissed!")
        })
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
