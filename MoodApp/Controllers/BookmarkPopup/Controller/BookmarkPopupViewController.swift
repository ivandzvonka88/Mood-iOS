//
//  BookmarkPopupViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 30/07/2021.
//

import UIKit

class BookmarkPopupViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var PrivacyTableView: UITableView!
    //VARIABLE'S
  //  var dataArray:[String] = ["Create new"]
    var categoryArray:[CategoryModel] = []
    var bookmarkArray:[BookMarkModel] = [BookMarkModel(name: "Category",isCat: true)]
    var selectedIndexPath :IndexPath = IndexPath(row: 0, section: 0)
    var delegate = PlayingViewController()
    
    var dataArray = [cellData2]()
    var dataArray2 = [String]()
    
    var iscatSelected = false
    var selectedcat = ""
    private let spacingIphone:CGFloat = 15.0
    private let spacingIpad:CGFloat = 10.0
    
    
    
    var isSelect = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let data = CommonHelper.getBookmarkData(){
//            for d in data{
//                self.categoryArray.append(d)
//            }
//
//        }
        dataArray2.append("Fruit")
        dataArray2.append("Vegitables")
        dataArray2.append("Grain")
        dataArray2.append("Milk")
        dataArray2.append("Fruit")

        self.populateData()

        self.collectionViewSetup()

    }
    
    func populateData(){
        self.dataArray.append(cellData2(name: "Mediterranean food(0)", iscat: false, width: 200.0,isSelected:false))
        self.dataArray.append(cellData2(name: "Bakery(0)", iscat: false, width: 120.0,isSelected:false))

    

        self.dataArray.append(cellData2(name: "Sweet(0)", iscat: false, width: 130.0,isSelected:false))
        
     
        
        self.dataArray.append(cellData2(name: "Vegan(0)", iscat: false, width: 195.0,isSelected:false))
        self.dataArray.append(cellData2(name: "Meat(0)", iscat: false, width: 180.0,isSelected:false))

        self.dataArray.append(cellData2(name: "Health food(5)", iscat: true, width: 170.0,isSelected:false))
        

        
  
        
        
        
        
        
//        self.dataArray.append(cellData(name: "Salads", image: "Vieetnameese", width: 120.0,isSelected:false))
//
//        self.dataArray.append(cellData(name: "Meat products", image: "Meet", width: 175.0,isSelected:false))
//
//        self.dataArray.append(cellData(name: "Eggs", image: "Vieetnameese", width: 120.0,isSelected:false))
//
//
//        self.dataArray.append(cellData(name: "Italian food", image: "Italian food", width: 150.0,isSelected:false))
//
//        self.dataArray.append(cellData(name: "Japaneese food", image: "Japaneese", width: 180.0,isSelected:false))
//        self.dataArray.append(cellData(name: "Dairy", image: "Dairy", width: 125.0,isSelected:false))
//
//
//        self.dataArray.append(cellData(name: "Vietnamese food", image: "Vieetnameese", width: 190.0,isSelected:false))
//        self.dataArray.append(cellData(name: "Breads", image: "Bread", width: 125.0,isSelected:false))
        
        
    }
    
    func collectionViewSetup() {
//        let layout = UICollectionViewFlowLayout()
//        if UIDevice.current.userInterfaceIdiom == .phone{
//          layout.sectionInset = UIEdgeInsets(top: 5, left: spacingIphone, bottom: 5, right: spacingIphone)
//          layout.minimumLineSpacing = 10
//          layout.minimumInteritemSpacing = 5
//        }
//        else{
//          layout.sectionInset = UIEdgeInsets(top: spacingIpad, left: spacingIpad, bottom: spacingIpad, right: spacingIpad)
//          layout.minimumLineSpacing = spacingIpad
//          layout.minimumInteritemSpacing = spacingIpad
//        }
//        self.categoryCollectionView?.collectionViewLayout = layout
      }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func applyBtnPressed(_ sender:Any){
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func closeBtnPressed(_ sender:Any){

        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createBtnPressed(_ sender:Any){

        let controller = self.storyboard!.instantiateViewController(withIdentifier: "savedbookmarkViewController") as! savedbookmarkViewController
        //controller.delegate = self
        self.present(controller, animated: true, completion: nil)
        //self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addCategoryBtnPressed(_ sender:Any){

        if bookmarkArray.count < 2 {
            
            self.bookmarkArray.append(BookMarkModel(name: "Sub Category"))

        }
        
        self.PrivacyTableView.reloadData()
    }
    
}

//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE
extension BookmarkPopupViewController:UITableViewDataSource,UITableViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
//        if isCreate && self.isEditings{
//            scrollView.contentOffset.y = 50
//        }
//
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
//        if self.categoryArray.count > 0{
//            return 2
//        }
//        else{
        if iscatSelected{
            return 3
        }
        else{
            return 2
        }
            
       // }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.categoryArray.count > 0{
//            if section == 0{
//                return self.categoryArray.count
//            }
//            else{
//                return self.bookmarkArray.count + 2
//            }
//        }
//        else{
     //       return self.bookmarkArray.count + 2
      //  }
        if iscatSelected{
            if section == 0 {
                return 1

            }
            else if section == 1 {
                return 1

            }
            else{
                return self.bookmarkArray.count + 2

            }
        }
        
        
        else{
            if section == 0 {
                return 1
            }
            else{
                return self.bookmarkArray.count + 2

            }
        }
        
 
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        
        if iscatSelected{
            
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath) as! subcatTableViewCell
                
                //cell.selectedBackgroundView = bgColorView
                cell.subcollectionview.delegate = self
                cell.subcollectionview.dataSource = self
                cell.subcollectionview.accessibilityHint = "cat1"
                cell.celllbl.text = selectedcat

                
                return cell
            }
            
            if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! BookmarkPopup1TableViewCell
                
                //cell.selectedBackgroundView = bgColorView
                cell.categorycollectionview.delegate = self
                cell.categorycollectionview.dataSource = self
                cell.categorycollectionview.accessibilityHint = "cat2"
                cell.categorycollectionview.alwaysBounceVertical = false
                
                return cell
            }
            else{
                
                if indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! BookmarkPopup3TableViewCell
                    cell.selectedBackgroundView = bgColorView
                    return cell
                }
                else if indexPath.row == self.bookmarkArray.count + 1{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! BookmarkPopup5TableViewCell
                    cell.selectedBackgroundView = bgColorView
                    cell.btnAddMore.tag = indexPath.row
                    cell.btnAddMore.addTarget(self, action: #selector(self.addCategoryBtnPressed(_:)), for: .touchUpInside)
                    return cell
                }
                else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! BookmarkPopup4TableViewCell
                    cell.selectedBackgroundView = bgColorView
                    cell.tfValue.text = self.bookmarkArray[indexPath.row - 1].tfValue
                    cell.tfValue.tag = indexPath.row
                    cell.tfValue.delegate = self
                    return cell
                }
            }
        }
        else{
            
            
            
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! BookmarkPopup1TableViewCell
                
                //cell.selectedBackgroundView = bgColorView
                cell.categorycollectionview.delegate = self
                cell.categorycollectionview.dataSource = self
                cell.categorycollectionview.accessibilityHint = "cat2"
                cell.categorycollectionview.alwaysBounceVertical = false
                
                return cell
            }
            else{
                
                if indexPath.row == 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! BookmarkPopup3TableViewCell
                    cell.selectedBackgroundView = bgColorView
                    return cell
                }
                else if indexPath.row == self.bookmarkArray.count + 1{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! BookmarkPopup5TableViewCell
                    cell.selectedBackgroundView = bgColorView
                    cell.btnAddMore.tag = indexPath.row
                    cell.btnAddMore.addTarget(self, action: #selector(self.addCategoryBtnPressed(_:)), for: .touchUpInside)
                    return cell
                }
                else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! BookmarkPopup4TableViewCell
                    cell.selectedBackgroundView = bgColorView
                    cell.tfValue.text = self.bookmarkArray[indexPath.row - 1].tfValue
                    cell.tfValue.tag = indexPath.row
                    cell.tfValue.delegate = self
                    return cell
                }
            }
            
            
        }
        

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        

      }
}
extension BookmarkPopupViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.accessibilityHint == "cat1"{
            
            return dataArray2.count

        }
        else{
            return dataArray.count

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.accessibilityHint == "cat1"{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subcatCollectionViewCell", for: indexPath) as! subcatCollectionViewCell
                    
            cell.lblsub.text = self.dataArray2[indexPath.row]
            
            return cell


        }
        else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CategoryCollectionViewCell
            
          //  cell.imageIcon.image = UIImage(named: self.dataArray[indexPath.row].image!)
            cell.lblName.text = self.dataArray[indexPath.row].name!
            
            if self.dataArray[indexPath.row].isSelected{
                cell.backgroundColor = UIColor().colorsFromAsset(name: .pinkColor)
                cell.lblName.textColor  = UIColor.white
            }
            else{
                cell.backgroundColor = .clear
                cell.lblName.textColor  = UIColor().colorsFromAsset(name: .textColor)

            }

            
            return cell

        }
        
     
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//            let label = UILabel(frame: CGRect.zero)
//            label.text = dataArray[indexPath.item].name!
//            label.sizeToFit()
//            //return CGSize(width: label.frame.width + 60 , height: 50)
//        return UICollectionViewFlowLayout.automaticSize
//        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if  iscatSelected{
            
            if dataArray[indexPath.row].iscat{
                
//                self.iscatSelected = false
//                self.PrivacyTableView.reloadData()
//                self.dataArray[indexPath.row].isSelected = false
//                collectionView.reloadItems(at: [indexPath])
            }
      
        }
        else{
            if dataArray[indexPath.row].iscat{
                self.iscatSelected = true
                self.selectedcat = dataArray[indexPath.row].name
                self.PrivacyTableView.reloadData()
                self.dataArray[indexPath.row].isSelected = true
                collectionView.reloadItems(at: [indexPath])
            }
          
        }
         
        
       
    }
    
    
}
extension BookmarkPopupViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
      self.bookmarkArray[textField.tag - 1].tfValue = textField.text
    }
}
