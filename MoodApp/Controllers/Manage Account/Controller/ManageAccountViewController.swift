//
//  ManageAccountViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 12/07/2021.
//

import UIKit

class ManageAccountViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var ManageAccountTableView: UITableView!
    
    //VARIABLE'S
    var settingArray:[SettingsModel] = [SettingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingArray.append(
            SettingsModel(name: "Account Information", entities: [
                EntityModel(title: "Phone Number", image_name: "", helping_title: ""),
                EntityModel(title: "Email", image_name: "", helping_title: ""),
                EntityModel(title: "Change Password", image_name: "", helping_title: ""),
                EntityModel(title: "Change categories you interested", image_name: "", helping_title: ""),
                EntityModel(title: "Change username", image_name: "", helping_title: "")
            ])
        )
        settingArray.append(
            SettingsModel(name: "Account Control", entities: [
                EntityModel(title: "Delete Account", image_name: "", helping_title: ""),
            ])
        )
        self.ManageAccountTableView.reloadData()
    }
}


//MARK:- HELPING METHOD'S
extension ManageAccountViewController{
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
}

//MARK:- UITABLEVIEW DATASOURCE AND DELEGATES METHODS
extension ManageAccountViewController:UITableViewDelegate,UITableViewDataSource{
    
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
        label.frame = CGRect.init(x: 8, y: 5, width: headerView.frame.width-20, height: headerView.frame.height-20)
        label.text = self.settingArray[section].name
        label.font = UIFont(name: Constant.GothamRounded_Book, size: 12)
        label.textColor = UIColor().colorsFromAsset(name: .text1Color)
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
        cell.SettingTitle.text = self.settingArray[indexPath.section].Entities[indexPath.row].title
        cell.SettingHelpingTitle.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0{
            if indexPath.row == 0{
                
                self.performSegue(withIdentifier: "toPhone", sender: nil)
            }else if indexPath.row == 1{
                
                self.performSegue(withIdentifier: "toEmail", sender: nil)
            }else if indexPath.row == 2{
                self.performSegue(withIdentifier: "toPassword", sender: nil)
            }
            else if indexPath.row == 3{
                self.performSegue(withIdentifier: "toCategory", sender: nil)
            }
            else if indexPath.row == 4{
                self.performSegue(withIdentifier: "toName", sender: nil)
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 0{
                let alertController = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
                let noAction = UIAlertAction(title: "No", style: .destructive) { action in
                    
                }
                let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
                    
                }
                //alertController.overrideUserInterfaceStyle = .dark
                alertController.setBackgroundColor(color: UIColor().colorsFromAsset(name: .alertColor))
                alertController.setTitle(font: UIFont(name: Constant.GothamRounded_Book, size: 17), color: UIColor().colorsFromAsset(name: .textColor))
                alertController.setMessage(font: UIFont(name: Constant.GothamRounded_Book, size: 13), color: UIColor().colorsFromAsset(name: .textColor))
                noAction.titleTextColor = UIColor().colorsFromAsset(name: .pinkColor)
                yesAction.titleTextColor = UIColor().colorsFromAsset(name: .textColor)
                
                alertController.addAction(yesAction)
                alertController.addAction(noAction)
                
                
                //alertController.setThemeUsingPrimaryColor(UIColor.black, withSecondaryColor: UIColor.blue, usingFontName: "GothamRounded-Book", andContentStyle: .dark)
                self.present(alertController, animated: true, completion: nil)
//                guard let label = alertController.value(forKey: "__representer")?.value(forKey:"label") as? UILabel else { return }
//                if label.text == noAction.title{
//                    label.attributedText = NSMutableAttributedString(string: label.text!, attributes: [NSAttributedString.Key.font : UIFont(name: Constant.GothamRounded_Book, size: 12)!])
//                }
//                else if label.text == yesAction.title{
//                    label.attributedText = NSMutableAttributedString(string: label.text!, attributes: [NSAttributedString.Key.font : UIFont(name: Constant.GothamRounded_Book, size: 12)!])
//                }
                
            }
        }
    }
}

