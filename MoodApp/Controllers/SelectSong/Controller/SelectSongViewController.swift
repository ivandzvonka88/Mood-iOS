//
//  SelectSongViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 14/07/2021.
//

import UIKit


class SelectSongViewController: UIViewController {

    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var favCollectionView: UICollectionView!
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var selectedIndexPath :IndexPath? = IndexPath(row: 0, section: 0)
    var selectedIndexPath1 :IndexPath? = IndexPath(row: 1, section: 0)
    var commentArray = [HomeModel]()
    var musicCategoryArray = [String]()
    var musicArray = [FMusicModel]()
    var resultMusicArray = [FMusicModel]()
    var isSearch = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musicArray = [
            FMusicModel(music: "Rectangle 11", name: "Song name 1", singer: "Singer 1", duration: "00:30"),
            FMusicModel(music: "Rectangle 12", name: "Song name 2", singer: "Singer 2", duration: "00:30",isSelected: true),
            FMusicModel(music: "Rectangle 13", name: "Song name 3", singer: "Singer 3", duration: "00:30"),
            FMusicModel(music: "Rectangle 14", name: "Song name 4", singer: "Singer 4", duration: "00:30"),
            FMusicModel(music: "Rectangle 15", name: "Song name 5", singer: "Singer 5", duration: "00:30"),
            FMusicModel(music: "Rectangle 16", name: "Song name 6", singer: "Singer 6", duration: "00:30"),
            FMusicModel(music: "Rectangle 17", name: "Song name 7", singer: "Singer 7", duration: "00:30",isSelected: true),
            FMusicModel(music: "Rectangle 18", name: "Song name 8", singer: "Singer 8", duration: "00:30")
        ]
        self.musicCategoryArray = ["Popular","New","Trending","Latino","K-Pop","Rock","Classic"]
        // Do any additional setup after loading the view.
        //self.collectionViewSetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        
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
        layout.scrollDirection = .horizontal
        self.favCollectionView?.collectionViewLayout = layout
      }
    @IBAction func textFieldChanged(_ sender:UITextField){
        if !sender.text!.isEmpty{
            isSearch = true
            if isSearch{
                self.resultMusicArray = self.musicArray.filter({ fMusicModel in
                    return fMusicModel.name.lowercased().contains(sender.text!.lowercased())
                })
                
            }
        }
        else{
            isSearch = false
        }
        self.commentTableView.reloadData()
    }

    @objc func selectSong(_ sender:UIButton){
        let indexPath = IndexPath(row: sender.tag, section: 0)
        if isSearch{
            if selectedIndexPath1 != nil {
                self.commentTableView.deselectRow(at: selectedIndexPath1!, animated: true)
            }
            
            print("Selected:\(indexPath)")
            let cell = self.commentTableView.cellForRow(at: indexPath) as! SelectSongTableViewCell
            selectedIndexPath1 = indexPath
            self.resultMusicArray[indexPath.row].isSelected = true
            cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
//            if self.resultMusicArray[sender.tag].isSelected{
//                self.resultMusicArray[sender.tag].isSelected = false
//            }
//            else{
//                self.resultMusicArray[sender.tag].isSelected = true
//            }
        }
        else{
            if selectedIndexPath1 != nil {
                self.commentTableView.deselectRow(at: selectedIndexPath1!, animated: true)
            }
            
            print("Selected:\(indexPath)")
            let cell = self.commentTableView.cellForRow(at: indexPath) as! SelectSongTableViewCell
            selectedIndexPath1 = indexPath
            self.musicArray[indexPath.row].isSelected = true
            cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
//            if self.musicArray[sender.tag].isSelected{
//                self.musicArray[sender.tag].isSelected = false
//            }
//            else{
//                self.musicArray[sender.tag].isSelected = true
//            }
        }
        self.commentTableView.reloadRows(at: self.commentTableView.indexPathsForVisibleRows!, with: .automatic)
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
extension SelectSongViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch{
            return self.resultMusicArray.count
        }
        else{
            return self.musicArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectSongTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        if isSearch{
            cell.imageAlbum.image = UIImage(named: self.resultMusicArray[indexPath.row].music)
            cell.lblsongname.text = self.resultMusicArray[indexPath.row].name
            cell.lblsingerName.text = self.resultMusicArray[indexPath.row].singer
            cell.lblcount.text = self.resultMusicArray[indexPath.row].duration
            if (selectedIndexPath1 == indexPath){
                self.resultMusicArray[indexPath.row].isSelected = true
                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
            }
            else{
                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 767"), for: .normal)
                self.resultMusicArray[indexPath.row].isSelected = false
            }
//            if self.resultMusicArray[indexPath.row].isSelected{
//                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
//
//            }
//            else{
//                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 767"), for: .normal)
//
//            }
        }
        else{
            cell.imageAlbum.image = UIImage(named: self.musicArray[indexPath.row].music)
            cell.lblsongname.text = self.musicArray[indexPath.row].name
            cell.lblsingerName.text = self.musicArray[indexPath.row].singer
            cell.lblcount.text = self.musicArray[indexPath.row].duration
            if (selectedIndexPath1 == indexPath){
                self.musicArray[indexPath.row].isSelected = true
                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
            }
            else{
                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 767"), for: .normal)
                self.musicArray[indexPath.row].isSelected = false
            }
//            if self.musicArray[indexPath.row].isSelected{
//
//                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
//
//            }
//            else{
//                cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 767"), for: .normal)
//
//            }
        }
        cell.ivSelected.tag = indexPath.row
        cell.ivSelected.addTarget(self, action: #selector(self.selectSong(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if isSearch{
            if selectedIndexPath1 != nil {
                tableView.deselectRow(at: selectedIndexPath1!, animated: true)
            }
            
            print("Selected:\(indexPath)")
            let cell = tableView.cellForRow(at: indexPath) as! SelectSongTableViewCell
            selectedIndexPath1 = indexPath
            self.resultMusicArray[indexPath.row].isSelected = true
            cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
//            if self.resultMusicArray[indexPath.row].isSelected{
//                self.resultMusicArray[indexPath.row].isSelected = false
//            }
//            else{
//                self.resultMusicArray[indexPath.row].isSelected = true
//            }
        }
        else{
            if selectedIndexPath1 != nil {
                tableView.deselectRow(at: selectedIndexPath1!, animated: true)
            }
            
            print("Selected:\(indexPath)")
            let cell = tableView.cellForRow(at: indexPath) as! SelectSongTableViewCell
            selectedIndexPath1 = indexPath
            self.musicArray[indexPath.row].isSelected = true
            cell.ivSelected.setImage(#imageLiteral(resourceName: "Group 796"), for: .normal)
//            if self.musicArray[indexPath.row].isSelected{
//                self.musicArray[indexPath.row].isSelected = false
//            }
//            else{
//                self.musicArray[indexPath.row].isSelected = true
//            }
        }
        tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .automatic)
    }
}
extension SelectSongViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.musicCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SelectSongCollectionViewCell
        
        if (selectedIndexPath == indexPath){
            cell.isSelected = true
            cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
        }
        else{
            cell.isSelected = false
            cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .textColor)
        }
        cell.lblCategoryName.text = self.musicCategoryArray[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        if selectedIndexPath != nil {
            collectionView.deselectItem(at: selectedIndexPath!, animated: true)
        }
        
        print("Selected:\(indexPath)")
        let cell = collectionView.cellForItem(at: indexPath) as! SelectSongCollectionViewCell
        cell.isSelected = true
        selectedIndexPath = indexPath
        cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let numberOfItemsPerRow:CGFloat = 6
//        let spacingBetweenCellsIphone:CGFloat = 5
//        let spacingBetweenCellsIpad:CGFloat = 10
//        if UIDevice.current.userInterfaceIdiom == .phone{
//          let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
//          if let collection = self.favCollectionView{
//            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//            return CGSize(width: width , height: collectionView.frame.height)
//          }else{
//            return CGSize(width: 0, height: 0)
//          }
//        }
//        else{
//          let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
//          if let collection = self.favCollectionView{
//            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
//            return CGSize(width: width , height: collectionView.frame.height - totalSpacing)
//          }else{
//            return CGSize(width: 0, height: 0)
//          }
//        }
//      }
    

}
extension SelectSongViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isSearch = true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.isSearch = false
        self.commentTableView.reloadData()
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }
}
