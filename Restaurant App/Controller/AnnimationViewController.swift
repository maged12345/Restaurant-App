//
//  AnnimationViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 07/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class AnnimationViewController: UIViewController {
    
    @IBOutlet  var rateButtons:[UIButton]!
    
    var restaurant:Restaurant?
    
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(data: (restaurant?.image!)!)
        
       
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurEffectView.frame = view.bounds
        imageView.addSubview(blurEffectView)
        
    
        
    }
    
    //MARK: - ViewWillApear method
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // first Way
        /*
       UIView.animate(withDuration: 3.0) {
            for rateButton in self.rateButtons {
                rateButton.alpha = 1
            }
       }
       */
        /*
       
        //Second Way of annimation tranform form right to original place
        UIView.animate(withDuration: 0.4, delay: 0.20, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
                  self.rateButtons[1].alpha = 1.0
                  self.rateButtons[1].transform = .identity
              }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.30, options: [], animations: {
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[2].transform = .identity
              }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.35, options: [], animations: {
                  self.rateButtons[3].alpha = 1.0
                  self.rateButtons[3].transform = .identity
              }, completion: nil)
        UIView.animate(withDuration: 0.4, delay: 0.40, options: [], animations: {
                  self.rateButtons[4].alpha = 1.0
            self.rateButtons[4].transform = .identity
              }, completion: nil)
     */
        
        
        
        
       
        let tranform = CGAffineTransform.init(translationX: 600, y: 0)
                   let scaleTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
                   let concatinatingTrasform = scaleTransform.concatenating(tranform)
                   for rateButton in rateButtons {
                       rateButton.alpha = 0
                       rateButton.transform = concatinatingTrasform
             }
         
        
        // third way of transform annimation with spring damp
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[0].transform = .identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                   self.rateButtons[1].alpha = 1.0
                   self.rateButtons[1].transform = .identity
               }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.20, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                   self.rateButtons[2].alpha = 1.0
                   self.rateButtons[2].transform = .identity
               }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.25, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                   self.rateButtons[3].alpha = 1.0
                   self.rateButtons[3].transform = .identity
               }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 0.30, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
                   self.rateButtons[4].alpha = 1.0
                   self.rateButtons[4].transform = .identity
               }, completion: nil)
        
        
        
    }
    
    
    
    
  
   
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
