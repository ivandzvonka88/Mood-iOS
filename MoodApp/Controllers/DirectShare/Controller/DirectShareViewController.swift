//
//  DirectShareViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 24/08/2021.
//

import UIKit

class DirectShareViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var selectedIndexPath :IndexPath? = IndexPath(row: 0, section: 0)
    var userArray = [HomeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DirectShareViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DirectShareTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        //cell.TitleLabel.text = self.dataArray[indexPath.row]
        if (selectedIndexPath == indexPath){
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .pinkColor)
            cell.ivCheck.isHidden = false
        }
        else{
            
            //cell.lblCategoryName.textColor = UIColor().colorsFromAsset(name: .textColor)
            cell.ivCheck.isHidden = true
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
        let cell = tableView.cellForRow(at: indexPath) as! DirectShareTableViewCell
        cell.ivCheck.isHidden = false
        tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: .automatic)

      }
}
