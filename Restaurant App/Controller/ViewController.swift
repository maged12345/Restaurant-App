//
//  ViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 29/09/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var emptyRestaurant: UIView!
    
    var restaurantArray = [Restaurant]()
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = emptyRestaurant
        tableView.backgroundView?.isHidden = true
       
        // Do any additional setup after loading the view.
        tableView.delegate  = self
       tableView.dataSource = self
        
        // customise the navigation Bar

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
      
    }
    override func viewWillAppear(_ animated: Bool) {
          loadData()
    }
    
    //MARK: - prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            if let des = segue.destination as? SeccondViewController  {
                     if let restaur = sender as? Restaurant {
                         des.single = restaur
                     }
                 }
               
        }
        
     
    }
    @IBAction func closedButtonUnWind(sender:UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

    //MARK: - Save and load methods
    func save () {
        do{
            try context.save()
        }catch{
            print("Error Saving Data from Core Data.\(error)")
        }
    }
    
    func loadData()  {
        let request:NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        do {
            restaurantArray =  try context.fetch(request)
            tableView.reloadData()
            
        }catch {
            print("Error when Load Data from CoreData. \(error)")
        }
      
    }
}




//MARK: - tableViewDataSource and tableViewDelegate Methods
extension ViewController:UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if restaurantArray.count > 0 {
            tableView.backgroundView?.isHidden = true
            tableView.separatorStyle = .singleLine
        }else {
            tableView.backgroundView?.isHidden = false
            tableView.separatorStyle = .none
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RestaurantTableViewCell
    
        cell.restaurantLabel.text = restaurantArray[indexPath.row].name
        cell.restaurantType.text = restaurantArray[indexPath.row].type
        cell.restaurantLocation.text = restaurantArray[indexPath.row].location
        cell.restaurantImage.image = UIImage(data: restaurantArray[indexPath.row].image!)
        /*
        if accessoryTypeArray[indexPath.row] {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
       
        */
        cell.accessoryType = restaurantArray[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    
    //MARK: method didSelcted Row At indexpath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "toSecondVC", sender: restaurantArray[indexPath.row])
        
//        print(indexPath.row)
//        let alert = UIAlertController(title: nil, message: "What do you want to do ?", preferredStyle: .actionSheet)
//
//        let actionOne =  UIAlertAction(title: "Call: 01129209279", style: .default) { (action) in
//                  let alertTwo = UIAlertController(title: "number unavailable", message:"sorry can't call this number" , preferredStyle: .alert)
//            alertTwo.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                  self.present(alertTwo, animated: true, completion: nil)
//              }
//        let nameChecking = accessoryTypeArray[indexPath.row] ? "Undo Check in" : "Check in"
//
//        let actionTwo = UIAlertAction(title: nameChecking, style: .default ) { (action) in
//            print("check in ...")
//
//            self.accessoryTypeArray[indexPath.row] = !self.accessoryTypeArray[indexPath.row]
//          //  let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//            //cell.accessoryType = self.accessoryTypeArray[indexPath.row] ? .checkmark : .none
//
//            tableView.reloadData()
//        }
//        let actionThree =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alert.addAction(actionOne)
//        alert.addAction(actionTwo)
//        alert.addAction(actionThree)
//        present(alert, animated: true, completion: nil)
 }
    
    
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("commit editing style ....")
        
        if editingStyle == .delete {
            restaurantNames.remove(at: indexPath.row)
            restaurantTypes.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
            restaurantLocations.remove(at: indexPath.row)
            accessoryTypeArray.remove(at: indexPath.row)
        }
        tableView.reloadData()
      //  tableView.deleteRows(at: [indexPath], with: .fade)
    }
    */
    //MARK: - trailingSwipeAction Method
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.context.delete(self.restaurantArray[indexPath.row])
            self.restaurantArray.remove(at: indexPath.row)
            self.save()
         
            tableView.deleteRows(at: [indexPath], with: .fade)
             self.save()
            completionHandler(true)
        }
        delete.image = UIImage(named: "delete")
        
        
        let share = UIContextualAction(style: .normal, title: "Share") { (action, view, completionHandler) in
            let text = self.restaurantArray[indexPath.row].name
            let activityController:UIActivityViewController
            if let image = UIImage(data:self.restaurantArray[indexPath.row].image!)  {
                activityController  = UIActivityViewController(activityItems: [text!,image], applicationActivities: nil)
            }else {
                activityController  = UIActivityViewController(activityItems: [text!], applicationActivities: nil)
            }
            
            
            self.present(activityController, animated: true, completion: nil)
            
                completionHandler(true)
            
            }
            
            
        share.image = UIImage(named: "share")
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [delete,share])
        swipeActionConfiguration.performsFirstActionWithFullSwipe = true
        return swipeActionConfiguration
    }
     //MARK: - LeadingSwipeAction Method
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        
        let check = UIContextualAction(style: .normal, title: "Check in ") { (action, view, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            cell.accessoryType =  self.restaurantArray[indexPath.row].isVisited ? .none : .checkmark
            self.restaurantArray[indexPath.row].isVisited = !self.restaurantArray[indexPath.row].isVisited
            self.save()
            completionHandler(true)
        }
        
        check.image = restaurantArray[indexPath.row].isVisited ? UIImage(named: "undo") :  UIImage(named: "tick")
        check.title =  restaurantArray[indexPath.row].isVisited ? "Check out" : "Check in"
        let swping = UISwipeActionsConfiguration(actions: [check])
        return swping
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

