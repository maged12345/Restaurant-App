//
//  SecondTableViewCellFour.swift
//  Restaurant App
//
//  Created by majid mohmed on 04/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit
import MapKit
class SecondTableViewCellFour: UITableViewCell {

    @IBOutlet weak var restaurantMapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func confifure(location:String) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                let placeMark = placemarks[0]
                
                
                let annotation = MKPointAnnotation()
                         
                if let location = placeMark.location {
                    annotation.coordinate = location.coordinate
                    
                    self.restaurantMapView.addAnnotation(annotation)
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.restaurantMapView.setRegion(region, animated: false)
                }
                
            }
         
        }
        
        
    }
    
}
