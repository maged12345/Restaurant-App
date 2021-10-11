//
//  SecondTableViewCellOne.swift
//  Restaurant App
//
//  Created by majid mohmed on 04/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit

class SecondTableViewCellOne: UITableViewCell {
    @IBOutlet weak var phoneNumber: UILabel!
         
         @IBOutlet weak var phoneImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
