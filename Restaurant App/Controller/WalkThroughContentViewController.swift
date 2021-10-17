//
//  WalkThroughScreenViewController.swift
//  Restaurant App
//
//  Created by majid mohmed on 16/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class WalkThroughContentViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var headingLabel:UILabel! {
        didSet{
            headingLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var subHeadingLabel:UILabel! {
        didSet{
            subHeadingLabel.numberOfLines  = 0
        }
    }
    @IBOutlet weak var imageView:UIImageView!
    
    // Properties
    var index = 0
    var heading = ""
    var subHeading = ""
    var image = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        imageView.image = UIImage(named:image)
        
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
