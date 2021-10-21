//
//  PlayingCommentViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import Cosmos
class PlayingCommentViewController: UIViewController {

    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var lblVideoName: UILabel!
    @IBOutlet weak var lblSong: UILabel!
    @IBOutlet weak var comentingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.optionsView.drawCorner(roundTo: .left)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.comentingView.drawCorner(roundTo: .top)
        self.comentingView.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.comentingView.frame, andColors: [UIColor.clear,UIColor.black])
    }
    func loadData(){
        
    }

    @IBAction func likeBtnPressed(_ sender:UIGestureRecognizer){
        if let imageview = sender.view{
            if let image = imageview.subviews.first as? UIImageView{
                if image.tag == 0{
                    image.tag = 1
                    image.image = #imageLiteral(resourceName: "Icon")
                }
                else{
                    image.tag = 0
                    image.image = #imageLiteral(resourceName: "Icon1")
                }
            }
        }
        
    }
    @IBAction func commentsBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toComment", sender: nil)
    }
    @IBAction func shareBtnPressed(_ sender:UIGestureRecognizer){
        let view = sender.view
        let vc = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "Rectangle 33")], applicationActivities: [])
        //vc.excludedActivityTypes = [.airDrop,.assignToContact,.copyToPasteboard,.mail,.markupAsPDF,.message,.openInIBooks,.print,.saveToCameraRoll]
        vc.overrideUserInterfaceStyle = .dark
        if UIDevice.current.userInterfaceIdiom == .pad {
            OperationQueue.main.addOperation({() -> Void in
                if let popoverController = vc.popoverPresentationController {
                  popoverController.sourceView = self.view
                    popoverController.sourceRect = view!.frame
                }
                self.present(vc, animated: true, completion: nil)
            })
        }
        else {
            self.present(vc, animated: true, completion: nil)
        }
    }
    @IBAction func musicBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toMusic", sender: nil)
    }
    @IBAction func mapBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toLocate", sender: nil)
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
