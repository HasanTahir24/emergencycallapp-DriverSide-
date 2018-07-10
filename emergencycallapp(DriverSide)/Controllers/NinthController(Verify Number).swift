//
//  NinthController(Verify Number).swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/4/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import FirebaseAuth
class NinthController_Verify_Number_: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var requestcallbutton: UIButton!
    @IBOutlet weak var resendcodebutton: UIButton!
    @IBOutlet weak var NumberLabel: UILabel!
    @IBOutlet weak var timelabel2: UILabel!
    @IBOutlet weak var timelabel1: UILabel!
    @IBOutlet weak var tf1: TextFieldDesign!
    @IBOutlet weak var tf2: TextFieldDesign!
    
    @IBOutlet weak var tf4: TextFieldDesign!
    @IBOutlet weak var tf3: TextFieldDesign!
    
    @IBOutlet weak var tf6: TextFieldDesign!
    @IBOutlet weak var tf5: TextFieldDesign!
    
    var timer = Timer()
    var seconds=60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberLabel.text=UserDetails.driverphonenumber
        
       timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timelabelupdate), userInfo: nil, repeats: true)
        super.viewDidLoad()
        tf1.delegate=self
        tf2.delegate=self
        tf3.delegate=self
        tf4.delegate=self
        tf5.delegate=self
        tf6.delegate=self
        
        tf1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf5.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        tf6.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    @objc func textFieldDidChange (textField:UITextField)
    {
        let text = textField.text
        
        if text?.count == 1{
            switch textField {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf5.becomeFirstResponder()
            case tf5:
                tf6.becomeFirstResponder()
            case tf6:
                tf6.resignFirstResponder()
                userVerification()
                
                
                
            default:
                break
            }
        }
    }


    func userVerification(){
      let retval = Authentication.userVerification(verificationCode:"\(tf1.text!)\(tf2.text!)\(tf3.text!)\(tf4.text!)\(tf5.text!)\(tf6.text!)" )
        
        if retval=="Incorrect verification code"{
            let alert=UIAlertController(title: "Incorrect verification code", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
          
                // return
            }
            else{
              self.performSegue(withIdentifier: retval, sender: nil)
            }
            // User is signed in
            // ...
        }
    
    @objc func timelabelupdate(){
         var timestr = ""
        seconds-=1
        if seconds == 0{
            timer.invalidate()
            resendcodebutton.isEnabled=true
            requestcallbutton.isEnabled=true
            
        }
        if seconds<10{
            timestr="00:0\(seconds)"
            
        }
        else{
            timestr="00:\(seconds)"
            
        }
        
        timelabel1.text=timestr
        timelabel2.text=timestr
        
    }
    
    
    @IBAction func resendcode(_ sender: Any) {
        Authentication.sendverificationcode()
    }
    
        
        
    }

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


