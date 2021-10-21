//
//  PrivacyViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit
import SemiModalViewController

class PrivacyViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var PrivacyTableView: UITableView!
    
    //VARIABLE'S
    var privacyArray:[SettingsModel] = [SettingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        privacyArray.append(
            SettingsModel(name: "Discoverability", entities: [
                EntityModel(title: "Private account", image_name: "", helping_title: ""),
                EntityModel(title: "Sync contacts from Facebook", image_name: "", helping_title: ""),
            ])
        )
        privacyArray.append(
            SettingsModel(name: "Safety", entities: [
                EntityModel(title: "Downloads", image_name: "", helping_title: "Only Me"),
                EntityModel(title: "Comments", image_name: "", helping_title: "Only Me"),
                EntityModel(title: "Following List", image_name: "", helping_title: "Only Me"),
                EntityModel(title: "Liked Videos", image_name: "", helping_title: "Only Me")
            ])
        )
    }
    func didChanged(val:String){
        if let indexPath = self.PrivacyTableView.indexPathForSelectedRow{
            self.privacyArray[indexPath.section].Entities[indexPath.row].helping_title = val
            self.PrivacyTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
}

//MARK:- HELPING METHOD'S
extension PrivacyViewController{
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
    
}

//MARK:- UITABLEVIEW DATASOURCE AND DELEGATES METHODS
extension PrivacyViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.privacyArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor().colorsFromAsset(name: .bgColor)
        let label = UILabel()
        label.frame = CGRect.init(x: 16, y: 5, width: headerView.frame.width-20, height: headerView.frame.height-20)
        label.text = self.privacyArray[section].name
        label.font = UIFont(name: Constant.GothamRounded_Book, size: 12)
        label.textColor = UIColor().colorsFromAsset(name: .text1Color)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.privacyArray[section].Entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as! NotificationTableViewCell
            let bgColorView = UIView()
            bgColorView.backgroundColor = .clear
            cell.selectedBackgroundView = bgColorView
            cell.NotificationLabel.text = self.privacyArray[indexPath.section].Entities[indexPath.row].title
            return cell
        }else{
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as! NotificationTableViewCell
                let bgColorView = UIView()
                bgColorView.backgroundColor = .clear
                cell.selectedBackgroundView = bgColorView
                cell.NotificationLabel.text = self.privacyArray[indexPath.section].Entities[indexPath.row].title
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
                let bgColorView = UIView()
                bgColorView.backgroundColor = .clear
                cell.selectedBackgroundView = bgColorView
                cell.SettingTitle.text = self.privacyArray[indexPath.section].Entities[indexPath.row].title
                cell.SettingHelpingTitle.text = self.privacyArray[indexPath.section].Entities[indexPath.row].helping_title
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if indexPath.row != 0{
                let options: [SemiModalOption : Any] = [
                    SemiModalOption.pushParentBack: false
                ]
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let identifier = String(describing: "PrivacyPopupViewController")
                let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! PrivacyPopupViewController
                
                controller.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
                controller.view.cornerRadius = 16
                controller.view.drawCorner(roundTo: .top)
                
                controller.delegate = self
                controller.isSelectedData = self.privacyArray[indexPath.section].Entities[indexPath.row].helping_title
                presentSemiViewController(controller, options: options, completion: {
                    print("Completed!")
                    
                    
                }, dismissBlock: {
                    //tableView.deselectRow(at: indexPath, animated: true)
                    print("Dismissed!")
                })
            }
            else{
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
        else{
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}


