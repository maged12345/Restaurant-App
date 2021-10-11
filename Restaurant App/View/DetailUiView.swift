//
//  DetailUiView.swift
//  Restaurant App
//
//  Created by majid mohmed on 03/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class DetailUiView: UIView {

    @IBOutlet weak var rateImageView:UIImageView!
  
    @IBOutlet weak var detailLocation: UILabel! {
        didSet {
            detailLocation.layer.cornerRadius = 4
            detailLocation.clipsToBounds = true
        }
    }
      
      @IBOutlet weak var detailName: UILabel!
      
      @IBOutlet weak var detailImage: UIImageView!
    
    
    

}
