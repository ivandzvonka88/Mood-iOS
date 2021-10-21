//
//  CameraPopup.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class CameraPopup: UIViewController {

    //IBOUTLET'S
    @IBOutlet weak var PopupCollectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    //VARIABLE'S
    let speedArray = ["0.3x","0.5x","1x","2x","3x"]
    let timerArray = ["1s","2s","3s","5s","10s"]
    let durationArray = ["10s","15s","30s","45s","60s"]
    let filters = ["Group 753","Group 750za","Group 753","Group 7516","Group 74832"]
    var selectedType = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        switch selectedType {
        case 0:
            self.lblTitle.text = "Speed"
        case 1:
            self.lblTitle.text = "Filters"
        case 2:
            self.lblTitle.text = "Timer"
        case 3:
            self.lblTitle.text = "Duration"
        default:
            break
        }
    }
    @IBAction func ApplyBtnAction(_ sender: Any) {
        self.dismissSemiModalViewWithCompletion {
            
        }
    }
    @IBAction func CloseBtnAction(_ sender: Any) {
        self.dismissSemiModalViewWithCompletion {
            
        }
    }
    
}

extension CameraPopup:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedType == 0{
            return self.speedArray.count
        }else if selectedType == 1{
            return self.filters.count
        }else if selectedType == 2{
            return self.timerArray.count
        }else{
            return self.durationArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if selectedType == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CameraTextCollectionViewCell", for: indexPath) as! CameraTextCollectionViewCell
            cell.TitleLabel.text = self.speedArray[indexPath.row]
            return cell
        }else if selectedType == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CameraFiltersCollectionViewCell", for: indexPath) as! CameraFiltersCollectionViewCell
            cell.FilterImage.image = UIImage(named: self.filters[indexPath.row])
            return cell
        }else if selectedType == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CameraTextCollectionViewCell", for: indexPath) as! CameraTextCollectionViewCell
            cell.TitleLabel.text = self.timerArray[indexPath.row]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CameraTextCollectionViewCell", for: indexPath) as! CameraTextCollectionViewCell
            cell.TitleLabel.text = self.durationArray[indexPath.row]
            return cell
        }
    }    
}
