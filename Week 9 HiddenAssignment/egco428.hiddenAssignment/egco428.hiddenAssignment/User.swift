//
//  User.swift
//  egco428.hiddenAssignment
//
//  Created by Pathompong Chaisri on 12/6/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//



import Foundation

class User {
    var Username:String?
    var Password:String?
    var Latitude:Double?
    var Longtitude:Double?
    init(user: String, pass: String, lat: Double, long: Double) {
        self.Username = user
        self.Password = pass
        self.Latitude = lat
        self.Longtitude = long
    }
}
