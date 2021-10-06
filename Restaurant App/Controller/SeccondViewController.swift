//
//  SeccondViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 02/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class SeccondViewController: UIViewController {
    var single:Restaurant?
  

    @IBOutlet weak var headerView: DetailUiView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
        headerView.detailImage.image = UIImage(named: single!.image!)
        headerView.detailName.text = single?.name
        headerView.detailLocation.text = single?.type
        tableView.delegate = self
        tableView.dataSource = self
        
    // Customization of the navaigation bar
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
        
        
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
extension SeccondViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as!SecondTableViewCellOne
            cell.phoneImage.image = UIImage(systemName: "phone")
            cell.phoneNumber.text = single?.phone
                  return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellOne", for: indexPath) as! SecondTableViewCellOne
            cell.phoneImage.image = UIImage(systemName: "map")
            cell.phoneNumber.text = single?.location
                  return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath) as! SecondTableViewCellTwo
            cell.descriptionLabel.text = single?.description
                  return cell
            case 3:
                     let cell = tableView.dequeueReusableCell(withIdentifier: "cellThree", for: indexPath) as! SeccondTableViewCellThree
                     cell.sebaratorLabel.text = "HOW TO GET HERE"
                           return cell
            case 4:
                     let cell = tableView.dequeueReusableCell(withIdentifier: "cellFour", for: indexPath) as! SecondTableViewCellFour
                     cell.confifure(location: single!.location!)
                    
                           return cell
        default:
            fatalError("Error in cell ")
        }
      
    }
    
    
}
