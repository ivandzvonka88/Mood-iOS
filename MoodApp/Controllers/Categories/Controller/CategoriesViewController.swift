//
//  CategoriesViewController.swift
//  MoodAppDesign
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var CategoriesCollectionView: UICollectionView!
    
    //VARIABLES
    let categoryArray = ["Vegetables","Fruits","Fish and seafood","Snack","American Food","Sweets","Meditarian Food","Salads","Meat Product","Eggs","Italian food","Japanees food","Dairy","Vietnamese food","Breads"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
//MARK:- UICOLLECTION VIEW DELEGATE AND DATASOURCE
extension CategoriesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
        cell.TitleLabel.text = self.categoryArray[indexPath.row]
        return cell
    }
    
    
}
