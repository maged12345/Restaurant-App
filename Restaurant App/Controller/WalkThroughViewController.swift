//
//  WalkThroughViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 16/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class WalkThroughViewController: UIViewController {
    
    var walkThroughPageViewController: WalkThroughPageViewController?
    
    //MARK: IBOutLet
    @IBOutlet weak var nextButton:UIButton!{
        didSet{
            nextButton.layer.cornerRadius = 25
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var skipButton:UIButton!
    
    @IBOutlet weak var pagecontroller:UIPageControl!

    //MARK: life cycle of ViewController
    override func viewDidLoad() {
        super.viewDidLoad()

        walkThroughPageViewController?.delegateWalkThrough = self
    }
    
    //MARK: - IBActions
    @IBAction func skipButonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "WalkThoughStandard")
           dismiss(animated: true, completion: nil)
    }
    @IBAction func nextButtonTapped( sender:UIButton) {
        UserDefaults.standard.set(true, forKey: "WalkThoughStandard")
        if let index = walkThroughPageViewController?.currentIndex {
            switch index {
                   case 0...1:
                       walkThroughPageViewController?.forward()
                   case 2:
                       dismiss(animated: true, completion: nil)
                   default:
                       break
                   }
        }
       upDateUI()
    }
    func upDateUI() {
        if let index = walkThroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("Next", for: .normal)
                skipButton.isHidden =  false
            case 2:
                nextButton.setTitle("Get Started", for: .normal)
            default:
                break
            }
            pagecontroller.currentPage = index
        }
    }
  
    // MARK: - Navigation prepare for segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let des = segue.destination as? WalkThroughPageViewController {
            walkThroughPageViewController = des
        }
    }
   
}
//MARK: - delegateMethod
extension WalkThroughViewController:WalkThroughPageDelegate {
    func didUpdatepageIndex(currentIndex: Int) {
        upDateUI()
    }
    
    
}
