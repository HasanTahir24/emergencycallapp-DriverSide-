//
//  MapFunctions.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 6/29/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import GoogleMaps
struct MapFunctions {
    
      static var shared = MapFunctions()
   static func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
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
