//
//  popularViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/12/21.
//

import UIKit

class popularViewController: UIViewController {
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var sarchtf: UITextField!
    @IBOutlet weak var tabView: UIVisualEffectView!
    @IBOutlet weak var tabView1: UIView!
    @IBOutlet weak var populartableview: UITableView!
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var popularArray = [PopularModel]()
    var resultPopularArray = [PopularModel]()
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popularArray = [
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 36", views: "1.5M"), hashtag: HashtagModel(hastag: "#first hashtag ", views: "Views 23M")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 37", views: "2.8M"), hashtag: HashtagModel(hastag: "#second hashtag ", views: "Views 987.1k")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 38", views: "4.1M"), hashtag: HashtagModel(hastag: "#third hashtag ", views: "Views 765.3k")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 39", views: "986.1k"), hashtag: HashtagModel(hastag: "#fourth hashtag ", views: "Views 125.5M")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 40", views: "6.8M"), hashtag: HashtagModel(hastag: "#fifth hashtag ", views: "Views 14.8M")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 41", views: "124.9k"), hashtag: HashtagModel(hastag: "#sixth hashtag ", views: "Views 23M")),
            PopularModel(popularVideo: PVideoModel(video: "Rectangle 36", views: "1.5M"), hashtag: HashtagModel(hastag: "#seventh hashtag ", views: "Views 987.1k"))
            
        ]
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabView.drawCorner(roundTo: .top)
        self.tabView1.drawCorner(roundTo: .top)
        self.tabView1.backgroundColor = UIColor.clear
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
        self.populartableview.reloadData()
    }
}

extension popularViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    
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
        cell.popluarcollection.delegate = self
        cell.popluarcollection.dataSource = self
        cell.popluarcollection.tag = indexPath.row
        DispatchQueue.main.async {
            cell.popluarcollection.reloadData()
        }
        return cell
    }
    

}


extension popularViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
        self.performSegue(withIdentifier: "toVideo", sender: nil)
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
