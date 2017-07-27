//
//  User.swift
//  workforce
//
//  Created by admin on 7/26/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper

class User: Mappable {
    var token: String?
    var userId: String?
    var employee_id: String?
    var status: String?
    var passMessage: String?
    var emailMessage: String?
    var first_name: String?
    var last_name: String?
    var email: String?
    var prof_picture: String?
    var division_name: String?
    var role_name: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        status          <- map["Status"]
        passMessage     <- map["Message.Password"]
        emailMessage    <- map["Message.Email"]
        token           <- map["UserData.Token"]
        userId          <- map["UserData.UserID"]
        employee_id     <- map["UserData.Data.employee_id"]
        first_name      <- map["UserData.Data.first_name"]
        last_name       <- map["UserData.Data.last_name"]
        email           <- map["UserData.Data.email"]
        role_name       <- map["UserData.Data.role_name"]
        
        
        
    }
}
