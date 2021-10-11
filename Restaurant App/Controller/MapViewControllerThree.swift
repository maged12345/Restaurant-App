//
//  MapViewControllerThree.swift
//  Restaurant App
//
//  Created by majid mohmed on 06/10/2021.
//  Copyright © 2021 majid mohmed. All rights reserved.
//

import UIKit
import MapKit

class MapViewControllerThree: UIViewController {

    var restaurant:Restaurant?
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsTraffic = true
        mapView.showsScale = true
        mapView.showsCompass = true
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(restaurant!.location!) { (placemarks, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant?.name
                annotation.subtitle = self.restaurant?.type
                
                if let location = placemark.location {
                    
                    annotation.coordinate = location.coordinate
                    
                
                    //self.mapView.addAnnotation(annotation)
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                    
                    
                }
                
                
                
                
            }
        }
  
        
        
        
        
        
        
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
