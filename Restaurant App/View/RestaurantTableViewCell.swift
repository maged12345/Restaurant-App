//
//  RestaurantTableViewCell.swift
//  Restaurant App
//
//  Created by majid mohmed on 29/09/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var restaurantLocation: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    
    @IBOutlet weak var restaurantLabel: UILabel!
    
    @IBOutlet weak var restaurantImage: UIImageView!
       
        {
        
        didSet{
            restaurantImage.layer.cornerRadius =  (restaurantImage.bounds.height) / 2
         
            
            
        }
        
    }

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
