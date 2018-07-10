//
//  SixthController.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/2/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class SixthController: UIViewController {
 var timer=Timer()
    @IBOutlet weak var calltimelabel: UILabel!
    
    @IBOutlet weak var totaltimelabel: UILabel!
    @IBOutlet weak var hospitaltimelabel: UILabel!
    @IBOutlet weak var patienttimelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds=calendar.component(.second, from: date)
        UserDetails.time_upon_reaching_hospital="\(hour):\(minutes):\(seconds)"
        let elapsed = Date().timeIntervalSince(UserDetails.starttime)
     print(elapsed)
       let hourconsumed=Int(elapsed/3600)
       let minuteconsumed=(Int(elapsed)-60*hourconsumed)/60
      var secondconsumed=Int(elapsed)
        
        
            secondconsumed-=hourconsumed*3600
         secondconsumed-=minuteconsumed*60
     
        totaltimelabel.text!+="\(hourconsumed):\(minuteconsumed):\(secondconsumed)"
        
      // let secondconsumed=Int(elapsed)
            
        
        
      
calltimelabel.text!+=UserDetails.Calltime
        
        hospitaltimelabel.text!+=UserDetails.time_upon_reaching_hospital
        
        patienttimelabel.text!+=UserDetails.time_upon_reaching_patient
        
        // Do any additional setup after loading the view.
       
        //print(appdelegate.latitude,appdelegate.longitude)
        
        // Do any additional setup after loading the view.
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
