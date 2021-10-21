//
//  PlayingViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import Cosmos
import SemiModalViewController
class PlayingViewController: UIViewController {

    @IBOutlet weak var videoCollectionView: UICollectionView!
    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var lblVideoName: UILabel!
    @IBOutlet weak var lblSong: UILabel!
    @IBOutlet weak var tabView: UIVisualEffectView!
    private let spacingIphone:CGFloat = 0.0
    private let spacingIpad:CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewSetup()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.videoCollectionView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabView.drawCorner(roundTo: .top)
        self.optionsView.drawCorner(roundTo: .left)
    }
    func loadData(){
        
    }
    func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        if UIDevice.current.userInterfaceIdiom == .phone{
          layout.sectionInset = UIEdgeInsets(top: spacingIphone, left: spacingIphone, bottom: spacingIphone, right: spacingIphone)
          layout.minimumLineSpacing = spacingIphone
          layout.minimumInteritemSpacing = spacingIphone
        }
        else{
          layout.sectionInset = UIEdgeInsets(top: spacingIpad, left: spacingIpad, bottom: spacingIpad, right: spacingIpad)
          layout.minimumLineSpacing = spacingIpad
          layout.minimumInteritemSpacing = spacingIpad
        }
        layout.scrollDirection = .vertical
        self.videoCollectionView?.collectionViewLayout = layout
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
        self.performSegue(withIdentifier: "toShare", sender: nil)
//        let view = sender.view
//        let vc = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "Rectangle 33")], applicationActivities: [])
//        //vc.excludedActivityTypes = [.airDrop,.assignToContact,.copyToPasteboard,.mail,.markupAsPDF,.message,.openInIBooks,.print,.saveToCameraRoll]
//        vc.overrideUserInterfaceStyle = .dark
//        if UIDevice.current.userInterfaceIdiom == .pad {
//            OperationQueue.main.addOperation({() -> Void in
//                if let popoverController = vc.popoverPresentationController {
//                  popoverController.sourceView = self.view
//                    popoverController.sourceRect = view!.frame
//                }
//                self.present(vc, animated: true, completion: nil)
//            })
//        }
//        else {
//            self.present(vc, animated: true, completion: nil)
//        }
    }
    @IBAction func musicBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toMusic", sender: nil)
    }
    @IBAction func mapBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toLocate", sender: nil)
    }
    @IBAction func bookmarkBtnPressed(_ sender:Any){
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "BookmarkPopupViewController") as! BookmarkPopupViewController
        controller.delegate = self
        self.present(controller, animated: true, completion: nil)
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
extension PlayingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlayerCollectionViewCell
        if indexPath.row == 0{
            cell.lblConst.constant = (self.tabView.frame.height - self.view.safeAreaInsets.bottom) + 16 + 44
        }else{
            cell.lblConst.constant = (self.tabView.frame.height - self.view.safeAreaInsets.bottom) + 16
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 1
        let spacingBetweenCellsIphone:CGFloat = 0
        let spacingBetweenCellsIpad:CGFloat = 0
        if UIDevice.current.userInterfaceIdiom == .phone{
            let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
            if let collection = self.videoCollectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: collectionView.frame.height)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
        else{
            let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
            if let collection = self.videoCollectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: collectionView.frame.height - totalSpacing)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
    }
}
