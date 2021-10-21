//
//  HomeViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import AlamofireImage
class HomeViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var btnNearby: UIButton!
    @IBOutlet weak var tabView: UIVisualEffectView!
    @IBOutlet weak var tabView1: UIView!
    @IBOutlet weak var tabView2: UIView!
    private let spacingIphone:CGFloat = 8.0
    private let spacingIpad:CGFloat = 16.0
    var categoryArray = [HomeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.categoryArray = [
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 31"),
            HomeModel(user_id:"@kitchen.polaris",first_name: "Rectangle 32"),
            HomeModel(user_id:"@art.food",first_name: "Rectangle 33"),
            HomeModel(user_id:"@sven.signardsson",first_name: "Rectangle 34"),
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 31"),
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 33"),
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 31"),
            HomeModel(user_id:"@kitchen.polaris",first_name: "Rectangle 32"),
            HomeModel(user_id:"@art.food",first_name: "Rectangle 33"),
            HomeModel(user_id:"@sven.signardsson",first_name: "Rectangle 34"),
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 31"),
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 33")
        ]
        self.collectionViewSetup()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabView.drawCorner(roundTo: .top)
        self.tabView1.drawCorner(roundTo: .top)
        self.tabView1.backgroundColor = UIColor.clear
        //self.tabView1.layer.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.tabView1.frame, andColors: [UIColor.black,UIColor.clear]).cgColor
        //self.tabView1.layer.compositingFilter = "sourceOverCompositing"
        self.tabView2.backgroundColor = UIColor.clear
//        let layer = CALayer()
//
//        if let filter = CIFilter(name:"CIGaussianBlur") {
//            filter.name = "CIGaussianBlur"
//            layer.backgroundFilters = [filter]
//            layer.setValue(1,forKeyPath: "backgroundFilters.CIGaussianBlur.inputRadius")
//            self.tabView1.layer.compositingFilter = filter
//        }
        
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
        
        self.homeCollectionView?.collectionViewLayout = layout
    }
    @IBAction func followingBtnPressed(_ sender:Any){
        self.btnFollowing.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
        self.btnNearby.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
    }
    @IBAction func nearbyBtnPressed(_ sender:Any){
        self.btnFollowing.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnNearby.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
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
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        
        if let name = self.categoryArray[indexPath.row].userId{
            cell.lblName.text = name
        }

        let plachldr = UIImage(named: self.categoryArray[indexPath.row].userFname)
        if let imag = self.categoryArray[indexPath.row].userFname{
            if let url = URL(string: imag){
                cell.ivImage.af.setImage(withURL: url, placeholderImage: plachldr, imageTransition: .crossDissolve(1), runImageTransitionIfCached: true)
            }
            else{
                cell.ivImage.image = plachldr
            }
        }
        else{
            cell.ivImage.image = plachldr
        }
        cell.ratingView.rating = 4
        if indexPath.row % 2 == 0{
            cell.vHot.isHidden = false
            cell.vHot.drawOneCorner(corners: .bottomLeft, radius: 10)
        }
        else{
            cell.vHot.isHidden = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCellsIphone:CGFloat = 8
        let spacingBetweenCellsIpad:CGFloat = 16
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
            
            if let collection = self.homeCollectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width * 1.27)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
        else{
            let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
            
            if let collection = self.homeCollectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width + spacingBetweenCellsIpad * 2)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
    }
}
