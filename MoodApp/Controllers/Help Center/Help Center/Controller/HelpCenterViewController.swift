//
//  HelpCenterViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class HelpCenterViewController: UIViewController {
    
    //IBOUTLET'S
    @IBOutlet weak var ManageAccountTableView: UITableView!
    
    //VARIABLE'S
    var settingArray:[SettingsModel] = [SettingsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingArray.append(
            SettingsModel(name: "Frequently Ask Questions", entities: [
                EntityModel(title: "Lorem ipsum", image_name: "", helping_title: ""),
                EntityModel(title: "Dolor si amet", image_name: "", helping_title: ""),
                EntityModel(title: "Sagittis nunc", image_name: "", helping_title: ""),
            ])
        )
        settingArray.append(
            SettingsModel(name: "Select a topic", entities: [
                EntityModel(title: "Consectetur adipiscing elit", image_name: "", helping_title: ""),
                EntityModel(title: "Ac et gravida hendrerit nunc", image_name: "", helping_title: ""),
                EntityModel(title: "Amet in et", image_name: "", helping_title: ""),
                EntityModel(title: "Semper ac alicum", image_name: "", helping_title: ""),
                EntityModel(title: "Facilisi nec bibendum", image_name: "", helping_title: ""),
                EntityModel(title: "Cursus sit nunc", image_name: "", helping_title: ""),
                EntityModel(title: "Netus facilisis vel ornare", image_name: "", helping_title: ""),
                EntityModel(title: "Etiam et dictum pretium", image_name: "", helping_title: ""),
                EntityModel(title: "Adipiscing amet vel", image_name: "", helping_title: ""),
                EntityModel(title: "Turpis volutpat sapien", image_name: "", helping_title: ""),
                EntityModel(title: "Sociis eu amet id", image_name: "", helping_title: "")
            ])
        )
        self.ManageAccountTableView.reloadData()
    }
}


//MARK:- HELPING METHOD'S
extension HelpCenterViewController{
    func getViewController(identifier:String)-> UIViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier)
        return vc
    }
}

//MARK:- UITABLEVIEW DATASOURCE AND DELEGATES METHODS
extension HelpCenterViewController:UITableViewDelegate,UITableViewDataSource{
    
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
        let loremIspum = self.getViewController(identifier: "LoremIpsumViewController") as! LoremIpsumViewController
        self.navigationController?.pushViewController(loremIspum, animated: true)
    }
}
