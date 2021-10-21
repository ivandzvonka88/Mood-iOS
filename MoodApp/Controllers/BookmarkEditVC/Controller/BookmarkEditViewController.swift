//
//  BookmarkEditViewController.swift
//  MoodApp
//
//  Created by Macbook Air on 9/2/21.
//

import UIKit

class BookmarkEditViewController: UIViewController {

    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var popularArray = [PopularModel]()
    var resultPopularArray = [PopularModel]()
    var isSearch = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
    
    @IBAction func checkbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

       
    }
}

extension BookmarkEditViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch{
            return self.resultPopularArray.count
        }
        else{
            return self.popularArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookeditTableViewCell") as! bookeditTableViewCell
        
        if isSearch{
            cell.lblhashtag.text = self.resultPopularArray[indexPath.row].hashtag.hastag
        }
        else{
            cell.lblhashtag.text = self.popularArray[indexPath.row].hashtag.hastag
            cell.deletebtn.addTarget(self, action: #selector(deleteBtn), for: .touchUpInside)
            cell.editbtn.addTarget(self, action: #selector(editbtn), for: .touchUpInside)
            cell.sharebn.addTarget(self, action: #selector(sharebtn), for: .touchUpInside)
            cell.messagebtn.addTarget(self, action: #selector(messagebtn), for: .touchUpInside)
            cell.deletebtn.tag = indexPath.row
          
        }
        cell.popluarcollection.delegate = self
        cell.popluarcollection.dataSource = self
        cell.popluarcollection.tag = indexPath.row
        DispatchQueue.main.async {
            cell.popluarcollection.reloadData()
        }
        return cell
    }
    
    @objc func deleteBtn(_ sender:UIButton){
        let inde = sender.tag
        
        
        
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "deletebookmarkViewController") as! deletebookmarkViewController
        controller.name = popularArray[inde].hashtag.hastag!
        self.present(controller, animated: true, completion: nil)
        
        
    }
    @objc func editbtn(){
        
        
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "bookmarktfViewController") as! bookmarktfViewController
        self.present(controller, animated: true, completion: nil)
        
    }
    @objc func messagebtn(){
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "DirectShareViewController") as! DirectShareViewController
        self.present(controller, animated: true, completion: nil)
        
    }
    @objc func sharebtn(){
        
        self.share(sender: self)
        
    }
    
    func share(_ shareImage:UIImage? = nil,sender:UIViewController){
        
        let vc = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "Rectangle 33")], applicationActivities: [])
        //vc.excludedActivityTypes = [.airDrop,.assignToContact,.copyToPasteboard,.mail,.markupAsPDF,.message,.openInIBooks,.print,.saveToCameraRoll]
        vc.overrideUserInterfaceStyle = .dark
        if UIDevice.current.userInterfaceIdiom == .pad {
            OperationQueue.main.addOperation({() -> Void in
                if let popoverController = vc.popoverPresentationController {
                  popoverController.sourceView = self.view
                    popoverController.sourceRect = sender.view.frame
                }
                self.present(vc, animated: true, completion: nil)
            })
        }
        else {
            self.present(vc, animated: true, completion: nil)
        }
    }

}


extension BookmarkEditViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
