//
//  SecondController.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 6/29/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire
import SwiftyJSON

class SecondController: UIViewController {
var timer=Timer()
    var lat :Double = Location.latitude
    var long:Double=Location.longitude
    var phonenumber=""
    
    @IBOutlet weak var mapview: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
     
   UserDetails.starttime=Date()
       
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:  lat+0.005 , longitude: long+0.005)
        // Do any additional setup after loading the view.
        
        let camera = GMSCameraPosition.camera(withLatitude: lat+0.005  , longitude:long+0.005, zoom: 15.0)
        mapview.camera=camera
        mapview.animate(to: camera)
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude:  lat , longitude: long)
        marker2.map=mapview
        // Do any additional setup after loading the view.
        
       
        
     
        marker.icon = MapFunctions.imageWithImage(image:UIImage(named: "Red Ambulance")! , scaledToSize: CGSize(width: 50, height: 50))
        marker.map=mapview
        let origin = "\(Location.latitude+0.005),\(Location.longitude+0.005)"
        let destination = "\(Location.latitude),\(Location.longitude)"
        print(origin,destination,"hihihihihi")
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving"
        var totaldistance=0
        var totalduration=0
        Alamofire.request(url).responseJSON {
            response in
            let json = try! JSON(data: response.data!)
            let routes=json["routes"].arrayValue
     // print(routes)
        
            for route in routes
            {   let legs=route["legs"].arrayValue
                for j in legs{
                    let steps=j["steps"].arrayValue
                   // print(steps)
                     for k in steps{
                        //print(k)
                        let distance=k["distance"].dictionaryValue
                         let duration=k["duration"].dictionaryValue
                        for l in distance{
                            if l.key=="value"
                            {
                                // print(l.value.intValue)
                                totaldistance += l.value.intValue
                                //totaldistance=Int(l.value as! String)!
                            }
                        }
                        for l in duration{
                            if l.key=="value"
                            {
                                // print(l.value.intValue)
                                totalduration += l.value.intValue
                                //totaldistance=Int(l.value as! String)!
                            }
                        }
                    
                }
                
                //print(totaldistance)
                 //   print(totalduration)
                let routeOverviewPolyline = route["overview_polyline"].dictionary
                let points = routeOverviewPolyline?["points"]?.stringValue
                let path = GMSPath.init(fromEncodedPath: points!)
                let polyline = GMSPolyline.init(path: path)
                polyline.strokeWidth = 3
                polyline.strokeColor = UIColor.red
                polyline.map = self.mapview
                
                }
            }
        }
        
 self.timer = Timer.scheduledTimer(timeInterval:10, target: self, selector: #selector(self.timeToMoveOn), userInfo: nil, repeats: false)
        //print(appdelegate.latitude,appdelegate.longitude)
        
        // Do any additional setup after loading the view.
    }
    @objc func timeToMoveOn(){
        self.performSegue(withIdentifier: "3rd", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func callbutton(_ sender: Any) {
        let num = URL(string: "tel://\(self.phonenumber)")!
        UIApplication.shared.open(num, options: [:], completionHandler: nil)
    }
    
   
    @IBAction func BackButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
