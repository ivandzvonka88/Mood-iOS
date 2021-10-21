//
//  LanguageViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class LanguageViewController: UIViewController {

    
    //IBOUTLET'S
    @IBOutlet weak var PrivacyTableView: UITableView!
    //VARIABLE'S
    var dataArray = ["English","Arabic","Deutch","Espanol","Suomi","Francais","Bahasa Indonesia","Русский","Turkiye","Viet Nam","Cebuano","Italiano","Polsky","Romana","Svenska"]
    var selectedIndexPath :IndexPath? = IndexPath(row: 0, section: 0)
    var delegate = SettingsViewController()
    var selectedLang:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        for (i,val) in self.dataArray.enumerated(){
            if selectedLang == val{
                self.selectedIndexPath?.row = i
            }
        }
        self.PrivacyTableView.reloadData()
    }
    @IBAction func ApplyBtnAction(_ sender: Any) {
        self.dismiss(animated: true){
            self.delegate.didChanged(val: self.dataArray[self.selectedIndexPath!.row])
        }
    }
    @IBAction func CloseBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- UITABLEVIEW DELEGATE AND DATASOURCE
extension LanguageViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrivacyPopupTableViewCell", for: indexPath) as! PrivacyPopupTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        cell.TitleLabel.text = self.dataArray[indexPath.row]
        if (selectedIndexPath == indexPath){
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
            cell.CheckMark.isHidden = false
        }
        else{
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .textColor)
            cell.CheckMark.isHidden = true
        }
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
