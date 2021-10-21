//
//  SettingsViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var SettingTableView: UITableView!
    
    //VARIABLE'S
    var settingArray:[SettingsModel] = [SettingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        settingArray.append(
            SettingsModel(name: "Account", entities: [
                EntityModel(title: "Manage Account", image_name: "User", helping_title: ""),
                EntityModel(title: "Privacy", image_name: "Iconl", helping_title: ""),
                EntityModel(title: "Share Profile", image_name: "Share", helping_title: "")
            ])
        )
        settingArray.append(
            SettingsModel(name: "Content & Activity", entities: [
                EntityModel(title: "Notification", image_name: "Notification", helping_title: ""),
                EntityModel(title: "App Language", image_name: "Layout", helping_title: "English")
            ])
        )
        settingArray.append(
            SettingsModel(name: "Support", entities: [
                EntityModel(title: "Report a problem", image_name: "Invoice", helping_title: ""),
                EntityModel(title: "Help Center", image_name: "Info-triangle", helping_title: "")
            ])
        )
        settingArray.append(
            SettingsModel(name: "About", entities: [
                EntityModel(title: "Terms & Condition", image_name: "Iconxzc", helping_title: ""),
                EntityModel(title: "Privacy Policy", image_name: "Iconxsx", helping_title: "")
            ])
        )
        settingArray.append(
            SettingsModel(name: "", entities: [
                EntityModel(title: "Logout", image_name: "Power-button", helping_title: "")
            ])
        )
        self.SettingTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func didChanged(val:String){
        if let indexPath = self.SettingTableView.indexPathForSelectedRow{
            self.settingArray[indexPath.section].Entities[indexPath.row].helping_title = val
            self.SettingTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}


//MARK:- HELPING METHOD'S
extension SettingsViewController{
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
    
    func share(_ shareImage:UIImage? = nil,sender:UITableViewCell){
        
        let vc = UIActivityViewController(activityItems: [#imageLiteral(resourceName: "Rectangle 33")], applicationActivities: [])
        //vc.excludedActivityTypes = [.airDrop,.assignToContact,.copyToPasteboard,.mail,.markupAsPDF,.message,.openInIBooks,.print,.saveToCameraRoll]
        vc.overrideUserInterfaceStyle = .dark
        if UIDevice.current.userInterfaceIdiom == .pad {
            OperationQueue.main.addOperation({() -> Void in
                if let popoverController = vc.popoverPresentationController {
                  popoverController.sourceView = self.view
                    popoverController.sourceRect = sender.frame
                }
                self.present(vc, animated: true, completion: nil)
            })
        }
        else {
            self.present(vc, animated: true, completion: nil)
        }
    }
}

//MARK:- UITABLEVIEW DATASOURCE AND DELEGATES METHODS
extension SettingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.settingArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor().colorsFromAsset(name: .bgColor)
        let label = UILabel()
        label.frame = CGRect.init(x: 16, y: 5, width: headerView.frame.width-20, height: headerView.frame.height-20)
        label.text = self.settingArray[section].name
        label.font = UIFont(name: Constant.GothamRounded_Book, size: 12)
        label.textColor = UIColor().colorsFromAsset(name: .textColor)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingArray[section].Entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        cell.SettingImage.image = UIImage(named: self.settingArray[indexPath.section].Entities[indexPath.row].image_name)
        cell.SettingTitle.text = self.settingArray[indexPath.section].Entities[indexPath.row].title
        cell.SettingHelpingTitle.text = self.settingArray[indexPath.section].Entities[indexPath.row].helping_title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            if indexPath.row == 0{//MANAGE ACCOUNT
                tableView.deselectRow(at: indexPath, animated: true)
                self.performSegue(withIdentifier: "toManage", sender: nil)
            }else if indexPath.row == 1{// PRIVACY
                tableView.deselectRow(at: indexPath, animated: true)
                self.performSegue(withIdentifier: "toPrivacy", sender: nil)
            }else{// SHARE PROFILE
                let cell = tableView.cellForRow(at: indexPath) as! SettingsTableViewCell
                self.share(sender: cell)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }else if indexPath.section == 1{
            if indexPath.row == 0{//NOTIFICATIONS
                tableView.deselectRow(at: indexPath, animated: true)
                self.performSegue(withIdentifier: "toNotify", sender: nil)
            }else{
                let language = self.getViewController(identifier: "LanguageViewController") as! LanguageViewController
                language.delegate = self
                language.selectedLang = self.settingArray[indexPath.section].Entities[indexPath.row].helping_title
                self.present(language, animated: true, completion: nil)
            }
        }
        else if indexPath.section == 2{
            if indexPath.row == 0{// REPORT A PROBLEM
                tableView.deselectRow(at: indexPath, animated: true)
                self.performSegue(withIdentifier: "toReport", sender: nil)
            }else{ // HELP CENTER
                tableView.deselectRow(at: indexPath, animated: true)
                self.performSegue(withIdentifier: "toHelp", sender: nil)
            }
        }else if indexPath.section == 3{// TERMS AND CONDITION AND PRIVACY POLICY
            let termsAndCondition = self.getViewController(identifier: "TermsAndConditionViewController") as! TermsAndConditionViewController
            self.present(termsAndCondition, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
