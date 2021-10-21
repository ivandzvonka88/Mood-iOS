//
//  HealtyFoodViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 02/09/2021.
//

import UIKit

class HealtyFoodViewController: UIViewController {

    @IBOutlet weak var HealtyFoodCollection: UICollectionView!
    var categoryArray = [HomeModel]()
    private let spacingIphone:CGFloat = 8.0
    private let spacingIpad:CGFloat = 16.0
    var popularArray = [PopularModel2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        self.popularArray = [
            PopularModel2(popularVideo: [PVideoModel(video: "Rectangle 36", views: "food"),PVideoModel(video: "Rectangle 37", views: "food"),PVideoModel(video: "Rectangle 38", views: "food"),PVideoModel(video: "Rectangle 38", views: "food"),PVideoModel(video: "Rectangle 38", views: "food"),PVideoModel(video: "Rectangle 38", views: "food"),PVideoModel(video: "Rectangle 38", views: "food")], val: "Fruit"),
            
                PopularModel2(popularVideo: [PVideoModel(video: "Rectangle 36", views: "food"),PVideoModel(video: "Rectangle 37", views: "food"),PVideoModel(video: "Rectangle 38", views: "food"),PVideoModel(video: "Rectangle 36", views: "food"),PVideoModel(video: "Rectangle 36", views: "food"),PVideoModel(video: "Rectangle 36", views: "food")], val: "Sweet"),
            
                PopularModel2(popularVideo: [PVideoModel(video: "Rectangle 36", views: "food"),PVideoModel(video: "Rectangle 37", views: "food"),PVideoModel(video: "Rectangle 38", views: "food"),PVideoModel(video: "Rectangle 37", views: "food"),PVideoModel(video: "Rectangle 37", views: "food"),PVideoModel(video: "Rectangle 37", views: "food")], val: "Meat"),
            
        ]
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
        self.HealtyFoodCollection?.collectionViewLayout = layout
    }
    @IBAction func backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func locationbtn(_ sender: Any) {
        
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "bookmarkmapViewController") as! bookmarkmapViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
}




extension HealtyFoodViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return popularArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularArray[section].popularVideo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
      viewForSupplementaryElementOfKind kind: String,
      at indexPath: IndexPath
    ) -> UICollectionReusableView {
      switch kind {
      // 1
      case UICollectionView.elementKindSectionHeader:
        // 2
        let headerView = collectionView.dequeueReusableSupplementaryView(
          ofKind: kind,
          withReuseIdentifier: "HealthyFoodHeader",
          for: indexPath)

        // 3
        guard let typedHeaderView = headerView as? HealthyFoodCollectionReusableView
        else { return headerView }

        // 4
        let searchTerm = self.popularArray[indexPath.section].val
        typedHeaderView.titleLabel.text = searchTerm
        return typedHeaderView
      default:
        // 5
        return UICollectionReusableView()
        assert(false, "Invalid element type")
      }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 65)
      }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! popularCollectionViewCell
        
        cell.ivImage.image = UIImage(named: self.popularArray[indexPath.section]
                                        .popularVideo[indexPath.row].video!)
//
////        if let name = self.categoryArray[indexPath.row].userId{
////            cell.lblName.text = name
////        }
//        cell.lblName.text = "dummy"
//
//        let plachldr = UIImage(named: self.categoryArray[indexPath.row].userFname)
////        if let imag = self.categoryArray[indexPath.row].userFname{
////            if let url = URL(string: imag){
////                cell.ivImage.af.setImage(withURL: url, placeholderImage: plachldr, imageTransition: .crossDissolve(1), runImageTransitionIfCached: true)
////            }
////            else{
//                cell.ivImage.image = plachldr
//            //}
////        }
////        else{
////            cell.ivImage.image = plachldr
////        }
//        cell.ratingView.rating = 4
//        if indexPath.row % 2 == 0{
//            cell.vHot.isHidden = false
//            cell.vHot.drawOneCorner(corners: .bottomLeft, radius: 10)
//        }
//        else{
//            cell.vHot.isHidden = true
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCellsIphone:CGFloat = 8
        let spacingBetweenCellsIpad:CGFloat = 16
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
            
            if let collection = self.HealtyFoodCollection{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width * 1.27)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
        else{
            let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
            
            if let collection = self.HealtyFoodCollection{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width + spacingBetweenCellsIpad * 2)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
    }
}

