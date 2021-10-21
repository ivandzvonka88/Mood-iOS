//
//  NotificationViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class NotificationViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var NotificationTableView: UITableView!
    
    //VARIABLE'S
    var notificationArray:[SettingsModel] = [SettingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notificationArray.append(
            SettingsModel(name: "Information", entities: [
                EntityModel(title: "Likes", image_name: "", helping_title: ""),
                EntityModel(title: "Commnents", image_name: "", helping_title: ""),
                EntityModel(title: "New Followers", image_name: "", helping_title: ""),
                EntityModel(title: "Mension", image_name: "", helping_title: "")
            ])
        )
        
        notificationArray.append(
            SettingsModel(name: "Message", entities: [
                EntityModel(title: "Direct Message", image_name: "", helping_title: "")
            ])
        )
        
        notificationArray.append(
            SettingsModel(name: "Video Update", entities: [
                EntityModel(title: "Video from account you follow", image_name: "", helping_title: ""),
                EntityModel(title: "Video Suggestions", image_name: "", helping_title: "")
            ])
        )
    }
    
    
}

//MARK:- HELPING METHOD'S
extension NotificationViewController{
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
}

//MARK:- UITABLEVIEW DATASOURCE AND DELEGATES METHODS
extension NotificationViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.notificationArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor().colorsFromAsset(name: .bgColor)
        let label = UILabel()
        label.frame = CGRect.init(x: 8, y: 5, width: headerView.frame.width-20, height: headerView.frame.height-20)
        label.text = self.notificationArray[section].name
        label.font = UIFont(name: Constant.GothamRounded_Book, size: 12)
        label.textColor = UIColor().colorsFromAsset(name: .text1Color)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notificationArray[section].Entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as! NotificationTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        cell.NotificationLabel.text = self.notificationArray[indexPath.section].Entities[indexPath.row].title
        cell.NotificationSwitch.isOn = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //        if indexPath.section == 0{
        //            if indexPath.row == 0{//MANAGE ACCOUNT
        //                let manageAccount = self.getViewController(identifier: "ManageAccountViewController") as! ManageAccountViewController
        //                self.navigationController?.pushViewController(manageAccount, animated: true)
        //            }else if indexPath.row == 2{// SHARE PROFILE
        //                self.share(shareImage: UIImage(named: "User"))
        //            }
        //        }else if indexPath.section == 2{
        //            if indexPath.row == 0{// REPORT A PROBLEM
        //                let reprotProblem = self.getViewController(identifier: "ReportAProblemViewController") as! ReportAProblemViewController
        //                self.navigationController?.pushViewController(reprotProblem, animated: true)
        //            }else{ // HELP CENTER
        //                let helpCenter = self.getViewController(identifier: "HelpCenterViewController") as! HelpCenterViewController
        //                self.navigationController?.pushViewController(helpCenter, animated: true)
        //            }
        //        }else if indexPath.section == 3{// TERMS AND CONDITION AND PRIVACY POLICY
        //            let termsAndCondition = self.getViewController(identifier: "TermsAndConditionViewController") as! TermsAndConditionViewController
        //            self.present(termsAndCondition, animated: true, completion: nil)
        //        }
    }
}

