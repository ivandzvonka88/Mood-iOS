//
//  PrivacyPopupViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class PrivacyPopupViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var PrivacyTableView: UITableView!
    //VARIABLE'S
    var dataArray = ["Every One","Only Me"]
    var selectedIndexPath :IndexPath? = IndexPath(row: 1, section: 0)
    var isSelectedData:String!
    var delegate = PrivacyViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        
        for (i,val) in self.dataArray.enumerated(){
            if isSelectedData == val{
                self.selectedIndexPath?.row = i
            }
        }
        self.PrivacyTableView.reloadData()
        
    }
    @IBAction func applyBtnPressed(_ sender:Any){
        self.dismissSemiModalViewWithCompletion {
            self.delegate.didChanged(val: self.dataArray[self.selectedIndexPath!.row])
        }
    }
    
}

//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE
extension PrivacyPopupViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyPopupTableViewCell", for: indexPath) as! PrivacyPopupTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        if (selectedIndexPath == indexPath){
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
            cell.CheckMark.isHidden = false
        }
        else{
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .textColor)
            cell.CheckMark.isHidden = true
        }
        cell.TitleLabel.text = self.dataArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //tablview.deselectRow(at: indexPath, animated: false)
        if selectedIndexPath != nil {
            tableView.deselectRow(at: selectedIndexPath!, animated: true)
        }
        
        print("Selected:\(indexPath)")
        selectedIndexPath = indexPath
        let cell = tableView.cellForRow(at: indexPath) as! PrivacyPopupTableViewCell
        cell.CheckMark.isHidden = false
        tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .automatic)

      }
}
