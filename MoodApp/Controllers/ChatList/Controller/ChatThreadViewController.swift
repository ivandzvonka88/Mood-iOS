//
//  ChatThreadViewController.swift
//  MoodAppDesign
//
//  Created by Macbook Air on 7/13/21.
//


struct PeopleStruct {
    var name:String!
    var image:String!
}
struct chatThread {
    var image:String!
    var mainMesage:String!
    var subMessge:String!
    var time:String!
    var Imagess:[chatImages]!
    var isImages:Bool!
    
    
}
struct SectionArray{
    
    var Thread:[chatThread]!
    var peopleStruct:[PeopleStruct]!

}

struct chatImages {
    var images:String!
}


import UIKit

class ChatThreadViewController: UIViewController {

    

    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    
    var upperCollectiondata = [PeopleStruct]()
    var messageArray = [chatThread]()
    var imagesArray = [chatImages]()
    
    var sectionarray = [SectionArray]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.setupnavigationButton()
        // Do any additional setup after loading the view.
    }
    
    func setupnavigationButton(){
        
        let btn2 = UIButton(type: .custom)
        btn2.setImage(UIImage(named: "Arrow left"), for: .normal)
        btn2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn2.addTarget(self, action: #selector(backBtn), for: .touchUpInside)
        let item2 = UIBarButtonItem(customView: btn2)
    
        self.navigationItem.setLeftBarButton(item2, animated: true)
        
    }
    
    @objc func backBtn(){
        
        self.navigationController?.popViewController(animated: true)
            }
    
    func loadData(){
        
        
        mainTableView.showsHorizontalScrollIndicator = false
        mainTableView.showsVerticalScrollIndicator = false
        
        self.upperCollectiondata.append(PeopleStruct(name: "Add new", image: "Group 843"))
        self.upperCollectiondata.append(PeopleStruct(name: "@mount", image: "Ellipse 28cdc"))

        self.upperCollectiondata.append(PeopleStruct(name: "@alexa", image: "Ellipse 28fgf"))
        self.upperCollectiondata.append(PeopleStruct(name: "@Valenti", image: "Ellipse 28q12"))
        self.upperCollectiondata.append(PeopleStruct(name: "@Kir.or..", image: "Ellipse 13"))
        self.upperCollectiondata.append(PeopleStruct(name: "@Martin", image: "Ellipse 12"))
        self.upperCollectiondata.append(PeopleStruct(name: "@Edward", image: "Ellipse 9"))
        
        self.sectionarray.append(SectionArray(Thread: nil, peopleStruct: self.upperCollectiondata))
        
        
        self.imagesArray.append(chatImages(images: "Rectangle 35dd"))
        self.imagesArray.append(chatImages(images: "Rectangle 35"))
        self.imagesArray.append(chatImages(images: "Rectangle 39"))
        
        self.messageArray.append(chatThread(image: "Ellipse 2345", mainMesage: "@moriarty", subMessge: "Porttitor nunc, lorem et ullamcorper ", time: "14:59", Imagess: nil, isImages: false))
        
        self.messageArray.append(chatThread(image: "Ellipse 28q12", mainMesage: "@sara.klipovska", subMessge: "Eu duis rhoncus, faucibus sed nibh et quam leo sed. ", time: "11:56", Imagess: imagesArray, isImages: true))
        self.messageArray.append(chatThread(image: "Ellipse 28cdc", mainMesage: "@Johnsson8", subMessge: "Duis suscipit quam felis, non ante fermentum ut. Eu duis rhoncus, faucibus sed nibh quam", time: "10:34", Imagess: nil, isImages: false))
        self.messageArray.append(chatThread(image: "Ellipse 28aza", mainMesage: "@koritskiy", subMessge: "Convallis vestibulum, odio aliquam ", time: "15:44", Imagess: nil, isImages: false))
        self.messageArray.append(chatThread(image: "Ellipse 12", mainMesage: "@mohammad.namravi", subMessge: "Ornare ipsum rhoncus amet malesuada enim nec, ipsum massa", time: "05:34", Imagess: nil, isImages: false))

        
        self.sectionarray.append(SectionArray(Thread: self.messageArray, peopleStruct: nil))
        
        
    }
    

}
extension ChatThreadViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1

        }
        else{
            return sectionarray[section].Thread.count

        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        else{
            if self.sectionarray[indexPath.section].Thread[indexPath.row].isImages{
                
                return 170
                
            }
            else{
                return 90
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "chatTableViewCell") as! chatTableViewCell
            
            cell.peopleCollectionView.delegate = self
            cell.peopleCollectionView.dataSource = self
            cell.peopleCollectionView.accessibilityHint = "people"
            cell.peopleCollectionView.showsHorizontalScrollIndicator = false
            cell.peopleCollectionView.showsVerticalScrollIndicator = false
            
            
            return cell
        }
        else{
            if self.sectionarray[indexPath.section].Thread[indexPath.row].isImages{
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "MessagewithImageTableViewCell") as! MessagewithImageTableViewCell
                
                cell.imageUser.image = UIImage(named: self.sectionarray[indexPath.section].Thread[indexPath.row].image!)
                cell.lblTime.text = self.sectionarray[indexPath.section].Thread[indexPath.row].time!
                cell.lblthread.text = self.sectionarray[indexPath.section].Thread[indexPath.row].mainMesage!
                cell.lblvbody.text = self.sectionarray[indexPath.section].Thread[indexPath.row].subMessge!
                cell.messageImagesCollection.delegate = self
                cell.messageImagesCollection.dataSource = self
                cell.messageImagesCollection.accessibilityHint = "image"
                cell.messageImagesCollection.showsHorizontalScrollIndicator = false
                cell.messageImagesCollection.showsVerticalScrollIndicator = false
                
                
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "MessageSimpleTableViewCell") as! MessageSimpleTableViewCell
                
                cell.imageUser.image = UIImage(named: self.sectionarray[indexPath.section].Thread[indexPath.row].image!)
                cell.lblTime.text = self.sectionarray[indexPath.section].Thread[indexPath.row].time!
                cell.lblthread.text = self.sectionarray[indexPath.section].Thread[indexPath.row].mainMesage!
                cell.lblvbody.text = self.sectionarray[indexPath.section].Thread[indexPath.row].subMessge!

                return cell
            }
            
            
            
        }
    }
    
    
    
    
    
    
}
extension ChatThreadViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.accessibilityHint == "image"{
            return self.imagesArray.count
        }
        else if collectionView.accessibilityHint == "people"{
            return self.upperCollectiondata.count
        }
        else{
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.accessibilityHint == "image"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessageImagesCollectionViewCell", for: indexPath) as! MessageImagesCollectionViewCell

            cell.imagesIcon.image = UIImage(named: self.imagesArray[indexPath.row].images!)

            return cell
        }
        else if collectionView.accessibilityHint == "people"{

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "peopleCollectionViewCell", for: indexPath) as! peopleCollectionViewCell

            cell.newBn.setTitle(self.upperCollectiondata[indexPath.row].name!, for: .normal)
            cell.poepleImageViwe.image = UIImage(named: self.upperCollectiondata[indexPath.row].image!)

            return cell
        }
        else{
            return UICollectionViewCell()
        }
    }
}
