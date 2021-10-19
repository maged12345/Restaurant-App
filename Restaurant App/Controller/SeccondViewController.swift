//
//  SeccondViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 02/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit
import CoreData
class SeccondViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var single:Restaurant?
    var myData = ""

    @IBOutlet weak var headerView: DetailUiView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.detailImage.image = UIImage(data: single!.image!)
        headerView.detailName.text = single?.name
        headerView.detailLocation.text = single?.type
        tableView.delegate = self
        tableView.dataSource = self
        
    // Customization of the navaigation bar
       
        //navigationItem.largeTitleDisplayMode = .never
        //navigationItem.backBarButtonItem?.title = "back"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
     
       
        tableView.contentInsetAdjustmentBehavior = .never
       print("Hi from Second  ViewDidload method ..............????")
        
   
         if let image =  single?.rating{
             headerView.rateImageView.image = UIImage(named:image)
         }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let transform = CGAffineTransform(translationX: 600  , y: 600)
                                             self.headerView.rateImageView.transform = transform
                                             self.headerView.rateImageView.alpha = 0
        
        

                   UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
                                         self.headerView.rateImageView.transform = .identity
                                                   self.headerView.rateImageView.alpha = 1
                                     }, completion: nil)
          
      
    }
  
    
//@IBAction unWindsegue from annimation ViewController
    @IBAction func unwindToDetailView (sender:UIStoryboardSegue) {

        dismiss(animated: true) {
              if let rate = sender.identifier {
                self.single?.rating = rate
                self.save()
                
                
              self.headerView.rateImageView.image = UIImage(named: self.single!.rating!)
               
                  }
           
       
        
        }
    }

    func save()  {
        do{
            try context.save()
        }catch{
            print("Error Saving data from CoreData \(error)")
        }
    }
    /*
    func loadData()  {
        let request:NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
     
        
        do{
             single = try context.fetch(request)
        }catch{
            print("Error Loading Data From Core Data.\(error)")
        }
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
            cell.descriptionLabel.text = single?.summary
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            if let des = segue.destination as? MapViewControllerThree {
                des.restaurant = single
                
            }
        }else if segue.identifier == "showAnnimation" {
            if let des = segue.destination as? AnnimationViewController {
                           des.restaurant = single
                           
        }
    }
    
    
}
}
