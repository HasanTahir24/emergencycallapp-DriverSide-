//
//  ThirdController.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/1/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class ThirdController: UIViewController {

    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var distancelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
distancelabel.text!+=UserDetails.Distance
        timelabel.text!+=UserDetails.Time
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ShowHospitalList(_ sender: Any) {
        self.performSegue(withIdentifier: "4th", sender: nil)
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
