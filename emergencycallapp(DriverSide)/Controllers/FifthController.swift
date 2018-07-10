//
//  FifthController.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/1/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import SwiftyJSON
class FifthController: UIViewController {
  var timer=Timer()
      let marker2=GMSMarker()
    @IBOutlet weak var mapview: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let camera = GMSCameraPosition.camera(withLatitude: (Location.hospital_lat+Location.latitude+0.005)/2 , longitude:(Location.hospital_long+Location.longitude+0.005)/2, zoom: 15.0)
        
        let marker1=GMSMarker()
        marker1.position=CLLocationCoordinate2D(latitude: Location.hospital_lat , longitude: Location.hospital_long)
        marker1.icon=MapFunctions.imageWithImage(image: #imageLiteral(resourceName: "Hospital"), scaledToSize: CGSize(width: 45.0, height: 45.0))
   marker1.map=mapview
        
       
        marker2.position=CLLocationCoordinate2D(latitude: Location.latitude+0.005 , longitude: Location.longitude+0.005)
        marker2.icon=MapFunctions.imageWithImage(image: #imageLiteral(resourceName: "Red Ambulance"), scaledToSize: CGSize(width: 45.0, height: 45.0))
        marker2.map=mapview
     
        //        let camera = GMSCameraPosition.camera(withLatitude: 37.33869543   , longitude:-122.02133632, zoom: 15.0)
        
        self.mapview.camera=camera
        let origin = "\(Location.latitude+0.005),\(Location.longitude+0.005)"
        let destination = "\(Location.hospital_lat),\(Location.hospital_long)"
        
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
        Alamofire.request(url).responseJSON {
            response in
            let json = try! JSON(data: response.data!)
            let routes=json["routes"].arrayValue
    
            for route in routes
            {
                let routeOverviewPolyline = route["overview_polyline"].dictionary
                let points = routeOverviewPolyline?["points"]?.stringValue
                let path = GMSPath.init(fromEncodedPath: points!)
                let polyline = GMSPolyline.init(path: path)
                polyline.strokeWidth = 3
                polyline.strokeColor = UIColor.red
                polyline.map = self.mapview
                
                
            }
            self.timer = Timer.scheduledTimer(timeInterval:10, target: self, selector: #selector(self.timeToMoveOn), userInfo: nil, repeats: false)
        }
      
        // Do any additional setup after loading the view.
    }

    @objc func timeToMoveOn(){
       // marker2.position=CLLocationCoordinate2D(latitude: Location.latitude+0.002 , longitude: Location.longitude+0.002)
       self.performSegue(withIdentifier: "6th", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
