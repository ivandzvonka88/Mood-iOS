//
//  BookmarklistViewController.swift
//  MoodApp
//
//  Created by Macbook Air on 9/2/21.
//

import UIKit

class BookmarklistViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var popularArray = [PopularModel]()
    var resultPopularArray = [PopularModel]()
    var isSearch = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false

        
        self.popularArray = [
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 36", views: "View all"), hashtag: HashtagModel(hastag: "Healthy Food (12)", views: "View all")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 37", views: "View all"), hashtag: HashtagModel(hastag: "Sweets(4) ", views: "View all")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 38", views: "View all"), hashtag: HashtagModel(hastag: "Meat(10) ", views: "Views 765.3k")),

    
            
        ]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forwardbtn(_ sender: Any) {
        
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "BookmarkEditViewController") as! BookmarkEditViewController
        self.navigationController?.pushViewController(controller, animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        

        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    @IBAction func textFieldChanged(_ textField:UITextField){
        
        
        if !textField.text!.isEmpty{
            isSearch = true
            if isSearch{
                self.resultPopularArray = self.popularArray.filter({ popularModel in
                    return popularModel.popularVideo.views.lowercased().contains(textField.text!.lowercased()) || popularModel.hashtag.views.lowercased().contains(textField.text!.lowercased()) || popularModel.hashtag.hastag.lowercased().contains(textField.text!.lowercased())
                })
            }
        }
        else{
            isSearch = false
        }
        self.tableview.reloadData()
    }
}

extension BookmarklistViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch{
            return self.resultPopularArray.count
        }
        else{
            return self.popularArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! popularTableViewCell
        
        if isSearch{
            cell.lblhashtag.text = self.resultPopularArray[indexPath.row].hashtag.hastag
            cell.lblsectionbutton.text = self.resultPopularArray[indexPath.row].popularVideo.views
        }
        else{
            cell.lblhashtag.text = self.popularArray[indexPath.row].hashtag.hastag
            cell.lblsectionbutton.text = self.popularArray[indexPath.row].popularVideo.views
        }
        
        cell.viewallbtn.addTarget(self, action: #selector(gotoedit), for: .touchUpInside)
        
        cell.popluarcollection.delegate = self
        cell.popluarcollection.dataSource = self
        cell.popluarcollection.tag = indexPath.row
        DispatchQueue.main.async {
            cell.popluarcollection.reloadData()
        }
        return cell
    }
    
    @objc func gotoedit(){
        
        
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "HealtyFoodViewController") as! HealtyFoodViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    

}


extension BookmarklistViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearch{
            return self.resultPopularArray.count
        }
        else{
            return self.popularArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! popularCollectionViewCell
        if isSearch{
            cell.ivImage.image = UIImage(named: self.resultPopularArray[indexPath.row].popularVideo.video)
        }
        else{
            cell.ivImage.image = UIImage(named: self.popularArray[indexPath.row].popularVideo.video)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // self.performSegue(withIdentifier: "toVideo", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2.7
        let spacingBetweenCellsIphone:CGFloat = 5
        let spacingBetweenCellsIpad:CGFloat = 10
        if UIDevice.current.userInterfaceIdiom == .phone{
          let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
            let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width , height: collectionView.frame.height - totalSpacing)
        }
        else{
          let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
            let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width , height: width + spacingBetweenCellsIpad * 2)
        }
      }
    
}
    
    
    
    
    
