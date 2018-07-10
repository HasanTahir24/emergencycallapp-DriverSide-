//
//  UserDetails.swift
//  emergencycallapp(DriverSide)
//
//  Created by Hasan on 7/1/18.
//  Copyright © 2018 Hasan. All rights reserved.
//

import Foundation
struct UserDetails{
    static var shared = UserDetails()
    static var Patientname=""
    static var Contact=""
    static var Distance=""
    static var Time=""
    static var Calltime=""
    static var time_upon_reaching_patient=""
    static var time_upon_reaching_hospital=""
    static var starttime=Date()
    static var driverphonenumber=""
    static var status = 0
}
