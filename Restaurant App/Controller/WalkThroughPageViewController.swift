//
//  WalkThroughPageViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 16/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

protocol WalkThroughPageDelegate {
    func didUpdatepageIndex(currentIndex:Int)
}

class WalkThroughPageViewController: UIPageViewController {
    
    var delegateWalkThrough:WalkThroughPageDelegate?
    
    var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    var pageSubHeadings = ["Pin your favorite restaurants and create your own food guide",
                              "Search and locate your favourite restaurant on Maps",
                              "Find restaurants shared by your friends and other foodies"]
    var currentIndex = 0
    
    //MARK: viewDidLoad method
    override func viewDidLoad() {
          super.viewDidLoad()

         
          // Set the data source and delegate to itself
          dataSource = self
         delegate = self
          
          // Create the first walkthrough screen
          if let startingViewController = contentViewController(at: 0) {
              setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
          }
      }
    
   
 
    
// MARK: - helper Method
    
    func contentViewController(at index :Int) -> WalkThroughContentViewController? {
        
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkThroughContentViewController") as? WalkThroughContentViewController {
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubHeadings[index]
            pageContentViewController.image = pageImages[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
    
    
    
    
  
    
    func forward () {
        currentIndex += 1
        if let nextPageContent = contentViewController(at: currentIndex) {
            setViewControllers([nextPageContent], direction: .forward, animated: true, completion: nil)
        }
    }
 

}
//MARK:-UIPageViewController DataSource & Delegate Methods after & before Methods & didfinish
extension WalkThroughPageViewController:UIPageViewControllerDataSource,UIPageViewControllerDelegate {
    // ViewController Before
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
       var index =  (viewController as! WalkThroughContentViewController).index
             //index -= 1
         index -= 1
             
         
         return contentViewController(at:index)
     }
     // ViewController After
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         var index = ( viewController as! WalkThroughContentViewController).index
         index += 1
         return contentViewController(at:index)
     }
    // didfinishAnimating
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkThroughContentViewController {
                currentIndex = contentViewController.index
                delegateWalkThrough?.didUpdatepageIndex(currentIndex: currentIndex)
            }
        }
    }
}
