//
//  CommentsViewController.swift
//  MoodApp
//
//  Created by Buzzware Tech on 13/07/2021.
//

import UIKit

class CommentsViewController: UIViewController {

    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var comentingView: UIView!
    var commentArray = [HomeModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.comentingView.drawCorner(roundTo: .top)
        self.comentingView.backgroundColor = UIColor(gradientStyle: .topToBottom, withFrame: self.comentingView.frame, andColors: [UIColor.clear,UIColor.black])
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
extension CommentsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
    
}
