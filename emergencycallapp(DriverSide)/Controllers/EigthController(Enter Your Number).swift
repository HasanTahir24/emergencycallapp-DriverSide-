//
//  EigthController(Enter Your Number).swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/4/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import CountryPickerView
import FirebaseAuth
class EigthController_Enter_Your_Number_: UIViewController {
    
  let cpv = CountryPickerView(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneNumberField.leftView = cpv
        phoneNumberField.leftViewMode = .always
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var phoneNumberField: UITextField!
    
 
    @IBAction func Continue_With_Number(_ sender: UIButton) {
        if (phoneNumberField.text == "")   {
            
            print("Error")
            let alert = UIAlertController(title: "Error ", message: "Required Phone Number", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true,completion: nil)
        }
        else if (self.phoneNumberField.text?.count)! > 10 {
            let alert = UIAlertController(title: "Number is Too Big ", message: "Please correct your number ", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
        else if (self.phoneNumberField.text?.count)! < 10 {
            let alert = UIAlertController(title: "Number is Too Short ", message: "Please correct your number ", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
            alert.addAction(okay)
            self.present(alert, animated: true, completion: nil)
            
        }
            
            
        else {
            let alert = UIAlertController(title: "Is this your correct mobile number?", message: "\(self.cpv.selectedCountry.phoneCode)\(phoneNumberField.text!)", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            
            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler:{ (action) in
                alert.dismiss(animated: true, completion: nil)
                UserDetails.driverphonenumber = "\(self.cpv.selectedCountry.phoneCode)\(self.phoneNumberField.text!)"
                self.performSegue(withIdentifier: "NumberConfirmed", sender: nil)
                Authentication.sendverificationcode()
            }))
            
            alert.addAction( UIAlertAction(title: "Edit", style: .default, handler: {
                (action) in alert.dismiss(animated: true, completion: nil)
                
            }
            ))
         
        }

}

    
}
