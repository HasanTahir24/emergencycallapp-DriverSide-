//
//  FourthViewController.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/1/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var hospitalarray=["Jinnah Hospital","Aga Khan Hospital","Liaquat National Hospital"]
 var hospitallocations=["Jinnah Hospital":(Location.latitude+0.008,Location.longitude+0.008),"Aga Khan Hospital":(Location.latitude-0.008,Location.longitude+0.007),"Liaquat National Hospital":(Location.latitude-0.004,Location.longitude-0.003)]
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds=calendar.component(.second, from: date)
        UserDetails.time_upon_reaching_patient="\(hour):\(minutes):\(seconds)"
        
        super.viewDidLoad()
tableview.delegate=self
        tableview.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitalarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text=hospitalarray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location=self.hospitallocations[hospitalarray[indexPath.row]]!
        Location.hospital_lat=location.0
        Location.hospital_long=location.1
        self.performSegue(withIdentifier: "5th", sender: nil)
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
