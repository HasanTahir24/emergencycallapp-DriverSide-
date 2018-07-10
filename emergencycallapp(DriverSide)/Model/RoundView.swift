//
//  RoundView.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 6/26/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit

@IBDesignable class RoundView: UIView {
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
    
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }

        // Do any additional setup after loading the view.
    }


        // Dispose of any resources that can be recreated.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


