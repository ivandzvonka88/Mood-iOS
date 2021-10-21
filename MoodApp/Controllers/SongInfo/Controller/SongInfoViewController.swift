//
//  SongInfoViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class SongInfoViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var categoryArray = [HomeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 32"),
            HomeModel(user_id:"@mort.ikol",first_name: "Rectangle 33")
        ]
        self.collectionViewSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SongInfoViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
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
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "toVideo", sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCellsIphone:CGFloat = 5
        let spacingBetweenCellsIpad:CGFloat = 10
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
            
            if let collection = self.homeCollectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width , height: width * 1.2)
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
