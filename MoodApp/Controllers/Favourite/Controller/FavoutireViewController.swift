//
//  FavoutireViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//

import UIKit
enum FavouriteType:String{
    case video = "video"
    case hashtag = "hashtag"
    case music = "music"
}
class FavoutireViewController: UIViewController {

    @IBOutlet weak var favCollectionView: UICollectionView!
    @IBOutlet weak var favTableView: UITableView!
    @IBOutlet weak var bookmarkCollectionView: UICollectionView!
    @IBOutlet weak var btnVideo: UIButton!
    @IBOutlet weak var btnHashtag: UIButton!
    @IBOutlet weak var btnMusic: UIButton!
    var favouriteType:FavouriteType = .video
    private let spacingIphone:CGFloat = 5.0
    private let spacingIpad:CGFloat = 10.0
    var selectedIndexPath :IndexPath? = IndexPath(row: 0, section: 0)
    var videoArray = [FVideoModel]()
    var hashtagArray = [HashtagModel]()
    var musicArray = [FMusicModel]()
    var bookmarkArray = [CategoryModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        self.favTableView.isHidden = true
        self.videoArray = [
            FVideoModel(video: "Rectangle 36", views: "1.5M"),
            FVideoModel(video: "Rectangle 37", views: "2.8M"),
            FVideoModel(video: "Rectangle 38", views: "4.1M"),
            FVideoModel(video: "Rectangle 39", views: "986.1k"),
            FVideoModel(video: "Rectangle 40", views: "6.8M"),
            FVideoModel(video: "Rectangle 41", views: "124.9k")
        ]
        self.hashtagArray = [
            HashtagModel(hastag: "#first hashtag ", views: "Views 23M"),
            HashtagModel(hastag: "#second hashtag ", views: "Views 987.1k"),
            HashtagModel(hastag: "#third hashtag ", views: "Views 765.3k"),
            HashtagModel(hastag: "#fouth hashtag ", views: "Views 125.5M"),
            HashtagModel(hastag: "#fifth hashtag ", views: "Views 14.8M")
        ]
        self.musicArray = [
            FMusicModel(music: "Rectangle 11", name: "Song name 1", singer: "Singer 1", duration: "00:30"),
            FMusicModel(music: "Rectangle 12", name: "Song name 2", singer: "Singer 2", duration: "00:30"),
            FMusicModel(music: "Rectangle 13", name: "Song name 3", singer: "Singer 3", duration: "00:30"),
            FMusicModel(music: "Rectangle 14", name: "Song name 4", singer: "Singer 4", duration: "00:30"),
            FMusicModel(music: "Rectangle 15", name: "Song name 5", singer: "Singer 5", duration: "00:30"),
            FMusicModel(music: "Rectangle 16", name: "Song name 6", singer: "Singer 6", duration: "00:30"),
            FMusicModel(music: "Rectangle 17", name: "Song name 7", singer: "Singer 7", duration: "00:30"),
            FMusicModel(music: "Rectangle 18", name: "Song name 8", singer: "Singer 8", duration: "00:30")
        ]
        if let data = CommonHelper.getBookmarkData(){
            self.bookmarkArray = data
        }
        else{
            //CommonHelper.saveBookmarkData()
            //self.bookmarkArray = Constant.bookMarkArray
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.favTableView.reloadData()
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
        self.favCollectionView?.collectionViewLayout = layout
      }
    
    @IBAction func videoBtnPressed(_ sender: Any) {
        
        self.btnVideo.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
        self.btnVideo.setImage(#imageLiteral(resourceName: "Video"), for: .normal)
        self.btnHashtag.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnHashtag.setImage(#imageLiteral(resourceName: "Frame 21"), for: .normal)
        self.btnMusic.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnMusic.setImage(#imageLiteral(resourceName: "Music11"), for: .normal)
        self.favouriteType = .video
        self.favCollectionView.isHidden = false
        self.favTableView.isHidden = true
        self.favCollectionView.reloadData()
        
        
        
        
        
        
    }
    @IBAction func hastagBtnPressed(_ sender: Any) {
        
        self.btnVideo.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnVideo.setImage(#imageLiteral(resourceName: "Video1"), for: .normal)
        self.btnHashtag.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
        self.btnHashtag.setImage(#imageLiteral(resourceName: "Frame 211"), for: .normal)
        self.btnMusic.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnMusic.setImage(#imageLiteral(resourceName: "Music11"), for: .normal)
        self.favouriteType = .hashtag
        self.favCollectionView.isHidden = true
        self.favTableView.isHidden = false
        self.favTableView.reloadData()

        //change icon color and text color

    }
    
    
    @IBAction func musicBtn(_ sender: Any) {
        
        self.btnVideo.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnVideo.setImage(#imageLiteral(resourceName: "Video1"), for: .normal)
        self.btnHashtag.setTitleColor(UIColor().colorsFromAsset(name: .textColor), for: .normal)
        self.btnHashtag.setImage(#imageLiteral(resourceName: "Frame 21"), for: .normal)
        self.btnMusic.setTitleColor(UIColor().colorsFromAsset(name: .pinkColor), for: .normal)
        self.btnMusic.setImage(#imageLiteral(resourceName: "Music1"), for: .normal)
        self.favouriteType = .music
        self.favCollectionView.isHidden = true
        self.favTableView.isHidden = false
        self.favTableView.reloadData()

        //change icon color and text color

    }

}

extension FavoutireViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.favCollectionView:
            return self.videoArray.count
        case self.bookmarkCollectionView:
            return self.bookmarkArray.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.favCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! favCollectionViewCell
            cell.lblViews.text = self.videoArray[indexPath.row].views
            cell.ivImage.image = UIImage(named: self.videoArray[indexPath.row].video)
            return cell
        case self.bookmarkCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SelectSongCollectionViewCell
            
            if (selectedIndexPath == indexPath){
                cell.isSelected = true
                cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
            }
            else{
                cell.isSelected = false
                cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .textColor)
            }
            cell.lblCategoryName.text = self.bookmarkArray[indexPath.row].name
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case self.favCollectionView:
            collectionView.deselectItem(at: indexPath, animated: true)
            self.performSegue(withIdentifier: "toVideo", sender: nil)
        case self.bookmarkCollectionView:
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
        default:
            break
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 3
        let spacingBetweenCellsIphone:CGFloat = 5
        let spacingBetweenCellsIpad:CGFloat = 10
        if UIDevice.current.userInterfaceIdiom == .phone{
          let totalSpacing = (2 * self.spacingIphone) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIphone) //Amount of total spacing in a row
          if let collection = self.favCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width , height: width * 1.2)
          }else{
            return UICollectionViewFlowLayout.automaticSize
          }
        }
        else{
          let totalSpacing = (2 * self.spacingIpad) + ((numberOfItemsPerRow - 1) * spacingBetweenCellsIpad) //Amount of total spacing in a row
          if let collection = self.favCollectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width , height: width + spacingBetweenCellsIpad * 2)
          }else{
            return UICollectionViewFlowLayout.automaticSize
          }
        }
      }
    

}

extension FavoutireViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.favouriteType {
        case .hashtag:
            return self.hashtagArray.count
        case .music:
            return self.musicArray.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        switch self.favouriteType {
        case .hashtag:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! favHashtagTableViewCell
            
            cell.selectedBackgroundView = bgColorView
            cell.lblhastag.text = self.hashtagArray[indexPath.row].hastag
            cell.lblviews.text = self.hashtagArray[indexPath.row].views
            cell.imageHASH.image = #imageLiteral(resourceName: "Group 749cccv")
             return cell
        case .music:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! favMusicTableViewCell
            cell.selectedBackgroundView = bgColorView
            cell.imageAlbum.image = UIImage(named: self.musicArray[indexPath.row].music)
            cell.lblsongname.text = self.musicArray[indexPath.row].name
            cell.lblsingerName.text = self.musicArray[indexPath.row].singer
            cell.lblcount.text = self.musicArray[indexPath.row].duration
            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if favouriteType == .hashtag{
            let cell = tableView.cellForRow(at: indexPath) as! favHashtagTableViewCell
            cell.imageHASH.image = #imageLiteral(resourceName: "Group 749-2")
            self.performSegue(withIdentifier: "toTag", sender: nil)
        }
    }

}
