//
//  NewRestaurantTableViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 10/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class NewRestaurantTableViewController: UITableViewController ,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var newRestaurantImage: UIImageView!
    
    @IBOutlet weak var newRestaurantName: UITextField!{
        didSet {
            newRestaurantName.tag = 1
            newRestaurantName.becomeFirstResponder()
            newRestaurantName.delegate = self
        }
    }
    
    
    @IBOutlet weak var newRestaurantType: UITextField!{
        didSet{
            newRestaurantType.tag = 2
            
            newRestaurantType.delegate = self
        }
    }
    
    @IBOutlet weak var newRestaurantAdress: UITextField! {
        didSet{
            newRestaurantAdress.tag = 3
            newRestaurantAdress.delegate = self
        }
    }
    @IBOutlet weak var newRestaurantPhone: UITextField! {
        didSet{
            newRestaurantPhone.tag = 4
            newRestaurantPhone.delegate = self
        }
    }
    
    @IBOutlet weak var newRestaurantDescription: UITextView! {
        didSet {
            newRestaurantDescription.tag = 5
            
        }
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextTag = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTag.becomeFirstResponder()
        }
        
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure Nagigation Controller
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    //MARK: tableView didSelected Method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
   // use if statement to check if camera is availble or not to prevent App carsh
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
                
            }
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action) in
 // use if statement to check if camera is availble or not to prevent App carsh
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                                 imagePicker.allowsEditing = false
                                 imagePicker.sourceType = .photoLibrary
                                 
                                 self.present(imagePicker, animated: true, completion: nil)
                }
             
            }
            alert.addAction(cameraAction)
            alert.addAction(photoLibraryAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newRestaurantImage.image = selectedImage
            newRestaurantImage.contentMode = .scaleToFill
            
          newRestaurantImage.clipsToBounds = true
        }
        
         // configure the layout constrains of image programatically
        let leadding = NSLayoutConstraint(item: newRestaurantImage!, attribute: .leading, relatedBy: .equal, toItem: newRestaurantImage.superview, attribute: .leading, multiplier: 1, constant: 0)
                leadding.isActive = true
                
                let trailling =    NSLayoutConstraint(item: newRestaurantImage!, attribute: .trailing, relatedBy: .equal, toItem: newRestaurantImage.superview, attribute: .trailing, multiplier: 1, constant: 0)
                trailling.isActive = true
        
                let top =    NSLayoutConstraint(item: newRestaurantImage!, attribute: .top, relatedBy: .equal, toItem: newRestaurantImage.superview, attribute: .top, multiplier: 1, constant: 0)
                top.isActive = true
                
                let bottom =    NSLayoutConstraint(item: newRestaurantImage!, attribute: .bottom, relatedBy: .equal, toItem: newRestaurantImage.superview, attribute: .bottom, multiplier: 1, constant: 0)
                bottom.isActive = true
               
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func SaveButton(_ sender: UIBarButtonItem) {
        
        if newRestaurantName.text == "" || newRestaurantType.text == "" || newRestaurantPhone.text == "" || newRestaurantAdress.text == "" || newRestaurantDescription.text == "" {
            
            let alert = UIAlertController(title: "Oops", message: "We Can't proceed this operation because You should fill all of the fields", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
}
