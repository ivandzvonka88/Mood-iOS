//
//  popactivityViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//
struct popStruct{
    
    var name:String!
    var image:String!
    var check:String!
    var ischeck:Bool!
    
}
import UIKit

class popactivityViewController: UIViewController {

    @IBOutlet weak var tablview: UITableView!
    
    var dataArray = [popStruct]()
    
    var selectedIndexPath :IndexPath? = IndexPath(row: 2, section: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.populatetableView()
        // Do any additional setup after loading the view.
    }
    
    func populatetableView(){
        
        tablview.alwaysBounceVertical = false
        tablview.showsHorizontalScrollIndicator = false
        tablview.showsVerticalScrollIndicator = false
        tablview.isScrollEnabled = false

        dataArray.append(popStruct(name: "All Activity", image: "Star",check: "Check",ischeck: false))
        dataArray.append(popStruct(name: "Likes", image: "Heart",check: "Check",ischeck: false))
        dataArray.append(popStruct(name: "Comments", image: "Chat",check: "Check",ischeck: true))
        dataArray.append(popStruct(name: "Mentions", image: "At-sign",check: "Check",ischeck: false))
        dataArray.append(popStruct(name: "Followers", image: "User-plus",check: "Check",ischeck: false))
        
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    

}

extension popactivityViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablview.dequeueReusableCell(withIdentifier: "popActivityTableViewCell") as! popActivityTableViewCell

        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        if (selectedIndexPath == indexPath){
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
            if self.dataArray[indexPath.row].ischeck{
                cell.checkicon.isHidden = false
                cell.checkicon.image = UIImage(named: self.dataArray[indexPath.row].check!)

            }
            else
            {
                cell.checkicon.isHidden = true
            }
        }
        else{
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .textColor)
            if self.dataArray[indexPath.row].ischeck{
                cell.checkicon.isHidden = false
                cell.checkicon.image = UIImage(named: self.dataArray[indexPath.row].check!)

            }
            else
            {
                cell.checkicon.isHidden = true
            }
        }
        cell.imageIcon.image = UIImage(named: self.dataArray[indexPath.row].image!)
        cell.lblName.text = self.dataArray[indexPath.row].name!
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //tablview.deselectRow(at: indexPath, animated: false)
        if selectedIndexPath != nil {
            tableView.deselectRow(at: selectedIndexPath!, animated: true)
        }
        
        print("Selected:\(indexPath)")
        selectedIndexPath = indexPath
        if self.dataArray[indexPath.row].ischeck{
            self.dataArray[indexPath.row].ischeck = false
        }
        else{
            self.dataArray[indexPath.row].ischeck = true
        }
        tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .automatic)

      }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        

    }

}

