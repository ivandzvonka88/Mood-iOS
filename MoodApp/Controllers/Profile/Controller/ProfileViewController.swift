//
//  ProfileViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var tabView: UIVisualEffectView!
    @IBOutlet weak var tabView1: UIView!
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var categoryArray = [HomeModel]()
    var isMyVideo = true
    override func viewDidLoad() {
        super.viewDidLoad()

        self.categoryArray = [
            HomeModel(user_id:"1.5M",first_name: "Rectangle 31"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 32"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 33"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 34"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 31"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 33"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 31"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 32"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 33"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 34"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 31"),
            HomeModel(user_id:"1.5M",first_name: "Rectangle 33")
        ]
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabView.drawCorner(roundTo: .top)
        self.tabView1.drawCorner(roundTo: .top)
        self.tabView1.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func favBtnPressed(_ sender:Any){
        //self.performSegue(withIdentifier: "toFavuorite", sender: nil)
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "BookmarklistViewController") as! BookmarklistViewController
       // controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func settingBtnPressed(_ sender:Any){
        self.performSegue(withIdentifier: "toSetting", sender: nil)
    }
    @objc func myVideoBtnPressed(_ sender:UIButton){
        self.isMyVideo = true
        self.homeTableView.reloadRows(at: self.homeTableView.indexPathsForVisibleRows!, with: .automatic)
    }
    @objc func likeVideoBtnPressed(_ sender:UIButton){
        self.isMyVideo = false
        self.homeTableView.reloadRows(at: self.homeTableView.indexPathsForVisibleRows!, with: .automatic)
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
extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
            cell.btnSetting.addTarget(self, action: #selector(self.settingBtnPressed(_:)), for: .touchUpInside)
            cell.btnFavourite.addTarget(self, action: #selector(self.favBtnPressed(_:)), for: .touchUpInside)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! ProfileTableViewCell1
            cell.homeCollectionView.delegate = self
            cell.homeCollectionView.dataSource = self
            DispatchQueue.main.async {
                cell.homeCollectionView.reloadData()
            }
            cell.btnMyVideo.addTarget(self, action: #selector(self.myVideoBtnPressed(_:)), for: .touchUpInside)
            cell.btnLikeVideo.addTarget(self, action: #selector(self.likeVideoBtnPressed(_:)), for: .touchUpInside)
            if self.isMyVideo{
                cell.btnMyVideo.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
                cell.btnMyVideo.setImage(#imageLiteral(resourceName: "Video"), for: .normal)
                cell.btnLikeVideo.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
                cell.btnLikeVideo.setImage(#imageLiteral(resourceName: "Like"), for: .normal)
            }
            else{
                cell.btnMyVideo.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
                cell.btnMyVideo.setImage(#imageLiteral(resourceName: "Video1"), for: .normal)
                cell.btnLikeVideo.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
                cell.btnLikeVideo.setImage(#imageLiteral(resourceName: "Like1"), for: .normal)
            }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
extension ProfileViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
            
            let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width , height: width * 1.2)
        }
        else{
            let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
            
            let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width , height: width + spacingBetweenCellsIpad * 2)
        }
    }
}
