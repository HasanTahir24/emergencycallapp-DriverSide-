//
//  ViewController.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 6/21/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import FirebaseDatabase
class ViewController: UIViewController,CLLocationManagerDelegate  {
    var locationManager = CLLocationManager()
    var ref: DatabaseReference!
     let loc=Location()
  
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var patientcalllabel: UILabel!
    
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var distancelabel: UILabel!
    @IBOutlet weak var contactlabel: UILabel!
    @IBOutlet weak var patientciew: UIView!
    
    @IBOutlet weak var emrgencylabel: UILabel!
    @IBOutlet weak var acceptbutton: UIButton!
    let marker1 = GMSMarker()
    var counter=0
var appdelegate=UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var mapview: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        determineMyCurrentLocation()
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
        ref.child("Calls").observe(.value, with: {
            (snapshot) -> Void in
           
      //  print(snapshot)
            if snapshot.childrenCount>0{
               
                for i in snapshot.value as! [String:Any] {
                    let arr=i.value as! [String:Any]
                print(arr)

              self.namelabel.text="Patient Name : \(arr["Patient Name"]as! String)"
UserDetails.Patientname=arr["Patient Name"]as! String
                    
                self.contactlabel.text="Contact : \(arr["Contact"]as! String)"
UserDetails.Contact=arr["Contact"]as! String
                let dist=Double(arr["Distance"] as! Int )/1000
UserDetails.Distance = "\(dist) meters"
                self.distancelabel.text="Distance : \(dist) Km"
 let time = arr["Time"] as! Int
                    let hourconsumed=Int(time/3600)
                    let minuteconsumed=(time-60*hourconsumed)/60
                    var secondconsumed=time
                    secondconsumed-=hourconsumed*3600
                    secondconsumed-=minuteconsumed*60
                    self.timelabel.text!="Estimated time : \(hourconsumed):\(minuteconsumed):\(secondconsumed)"
           
self.patientciew.isHidden=false

                self.emrgencylabel.isHidden=true

                self.acceptbutton.isEnabled=true
                self.acceptbutton.isHidden=false
                    self.patientcalllabel.isHidden=false
            }
        }
        })
        
       
        
    }

    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if self.counter==0{
            self.counter=1
        
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        
        // manager.stopUpdatingLocation()
       Location.latitude=userLocation.coordinate.latitude
        Location.longitude=userLocation.coordinate.longitude
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:  Location.latitude+0.005 , longitude: Location.longitude+0.005)
        // Do any additional setup after loading the view.
        
        let camera = GMSCameraPosition.camera(withLatitude: Location.latitude+0.005  , longitude:Location.longitude+0.005, zoom: 15.0)
        mapview.camera=camera
        mapview.animate(to: camera)
        
      
        marker.icon = imageWithImage(image:UIImage(named: "Red Ambulance")! , scaledToSize: CGSize(width: 50.0, height: 50.0))
            marker.map=mapview
            //print(appdelegate.latitude,appdelegate.longitude)
        
        }
    }
 
    @IBAction func AccpetButtonPressed(_ sender: UIButton) {
     ref.child("Calls").removeValue()
        self.patientciew.isHidden=true
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds=calendar.component(.second, from: date)
        UserDetails.Calltime="\(hour):\(minutes):\(seconds)"
        
        self.performSegue(withIdentifier: "2nd", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="2nd"{
            if let dest = segue.destination as? SecondController{
      
            dest.phonenumber=self.contactlabel.text!
                
            }
        }
    }
    
}


