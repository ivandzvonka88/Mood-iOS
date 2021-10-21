//
//  ActivitesViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//

struct sectionName {
    var section:String!
    var activities:[activityStruct]!
}

struct activityStruct {
    
    var image:String!
    var name:String!
    var isfollow:Bool!
    var iswatch:Bool!
    var imagePost:String!
    var islast:Bool!
}

import UIKit

class ActivitesViewController: UIViewController {

    @IBOutlet weak var acitivityTableView: UITableView!
    @IBOutlet weak var tabView: UIVisualEffectView!
    @IBOutlet weak var tabView1: UIView!
    var dataArray1 = [activityStruct]()
    var dataArray2 = [activityStruct]()
    var dataArray3 = [activityStruct]()

    var sectionarray = [sectionName]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        self.populateTableView()
        self.setupnavigationbutton()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabView.drawCorner(roundTo: .top)
        self.tabView1.drawCorner(roundTo: .top)
        self.tabView1.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    func setupnavigationbutton(){
        
        
        let btn1 = UIButton(type: .custom)
            btn1.setImage(UIImage(named: "Comment"), for: .normal)
            btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn1.addTarget(self, action: #selector(chatBtn), for: .touchUpInside)
            let item1 = UIBarButtonItem(customView: btn1)

            let btn2 = UIButton(type: .custom)
            btn2.setImage(UIImage(named: "Settings-adjust"), for: .normal)
            btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn2.addTarget(self, action: #selector(filterBtn), for: .touchUpInside)
            let item2 = UIBarButtonItem(customView: btn2)
        
            self.navigationItem.setLeftBarButton(item2, animated: true)

            self.navigationItem.setRightBarButton(item1, animated: true)
    }
    
    @objc func chatBtn(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ChatThreadViewController") as! ChatThreadViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
        
            }
    
    @objc func filterBtn(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "popactivityViewController") as! popactivityViewController
        newViewController.modalTransitionStyle = .coverVertical
        self.present(newViewController, animated: true, completion: nil)
        
    }
    
    func populateTableView(){
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        acitivityTableView.showsHorizontalScrollIndicator = false
        acitivityTableView.showsVerticalScrollIndicator = false
        
        self.dataArray1.append(activityStruct(image: "Ellipse 28", name: "Top translation", isfollow: false, iswatch: true, imagePost: "",islast: false))
        self.dataArray1.append(activityStruct(image: "Ellipse 28azazazas", name: "Top translation", isfollow: false, iswatch: true, imagePost: "",islast: true))
        
        sectionarray.append(sectionName(section: "", activities: dataArray1))
        
        
      
        self.dataArray2.append(activityStruct(image: "Ellipse 6", name: "@ilopo.solot likes your video", isfollow: false, iswatch: false, imagePost: "Rectangle 381",islast: false))
        
        self.dataArray2.append(activityStruct(image: "Ellipse 7", name: "@antony.zakrevsky likes your video", isfollow: false, iswatch: false, imagePost: "Rectangle 381",islast: false))
        self.dataArray2.append(activityStruct(image: "Ellipse 5", name: "@Melinda5 follow you", isfollow: true, iswatch: false, imagePost: "Rectangle 381",islast: false))
        self.dataArray2.append(activityStruct(image: "Ellipse 12", name: "@velonds_korsova likes your video", isfollow: false, iswatch: false, imagePost: "Rectangle 381",islast: true))
        
        sectionarray.append(sectionName(section: "Today", activities: dataArray2))

   
        self.dataArray3.append(activityStruct(image: "Ellipse 13", name: "@ilopo.solot likes your video", isfollow: false, iswatch: false, imagePost: "Rectangle 381",islast: false))
        self.dataArray3.append(activityStruct(image: "Ellipse 28cdc", name: "@kim.makes.me.happy likes your video", isfollow: false, iswatch: false, imagePost: "Rectangle 381",islast: false))
        self.dataArray3.append(activityStruct(image: "Ellipse 28fgf", name: "@radj.mumbai likes your video", isfollow: false, iswatch: false, imagePost: "Rectangle 381",islast: true))
        
        
        sectionarray.append(sectionName(section: "Yesterday", activities: dataArray3))

    }


}
extension ActivitesViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return self.sectionarray.count
     }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0

        }
        else{
            return 45

        }
        
     }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = UIColor().colorsFromAsset(name: .bgColor)
       let label = UILabel()
       label.frame = CGRect.init(x: 8, y: 5,width: headerView.frame.width-20, height: headerView.frame.height-20)
        label.text = self.sectionarray[section].section!
       label.font = UIFont(name: Constant.GothamRounded_Book, size: 12)
       label.textColor = UIColor().colorsFromAsset(name: .textColor)
       headerView.addSubview(label)
       return headerView
     }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.sectionarray[section].activities.count
     }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
     
       
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "watchButtonTableViewCell") as! watchButtonTableViewCell
            
                cell.btnwatch.setTitle("Watch", for: .normal)
                cell.imageIcon.image = UIImage(named: self.sectionarray[indexPath.section].activities[indexPath.row].image!)
            
                 if self.sectionarray[indexPath.section].activities[indexPath.row].islast{
                    cell.buttomlineView.isHidden = false

                 }
                 else{
                    cell.buttomlineView.isHidden = true

                 }
                cell.lbldescription.text = self.sectionarray[indexPath.section].activities[indexPath.row].name!
                
                return cell
 
          
        }
        else{
            
            if sectionarray[indexPath.section].activities[indexPath.row].isfollow{
                let cell = tableView.dequeueReusableCell(withIdentifier: "watchButtonTableViewCell") as! watchButtonTableViewCell
                
                cell.btnwatch.setTitle("Follow", for: .normal)
                cell.imageIcon.image = UIImage(named: self.sectionarray[indexPath.section].activities[indexPath.row].image!)
                
                cell.lbldescription.text = self.sectionarray[indexPath.section].activities[indexPath.row].name!
                
                cell.buttomlineView.isHidden = true
                
                
                
                return cell
            }
            
            else{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "postacitivityTableViewCell") as! postacitivityTableViewCell
                cell.imageIcon.image = UIImage(named: self.sectionarray[indexPath.section].activities[indexPath.row].image!)
                cell.imagepost.image = UIImage(named: self.sectionarray[indexPath.section].activities[indexPath.row].imagePost!)
                cell.lblpost.text = self.sectionarray[indexPath.section].activities[indexPath.row].name!
                
                return cell
            }
            
            
            
        }
//
//
//
//       let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell") as! SettingsTableViewCell
//       cell.SettingTitle.text = self.settingArray[indexPath.section].Entities[indexPath.row].title
//       cell.SettingHelpingTitle.text = ""
//       return cell
     }
//     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       if indexPath.section == 0{
//         if indexPath.row == 0{
//           let phoneNumberVC = self.getViewController(identifier: "PhoneNumberViewController") as! PhoneNumberViewController
//           self.navigationController?.pushViewController(phoneNumberVC, animated: true)
//         }else if indexPath.row == 1{
//           let phoneNumberVC = self.getViewController(identifier: "EmailViewController") as! EmailViewController
//           self.navigationController?.pushViewController(phoneNumberVC, animated: true)
//         }
//       }
//     }
    
    
    
    
    
    
    
    
    
    
    
    
}
