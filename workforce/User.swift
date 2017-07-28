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
        passMessage     <- map["Message.Password.0"]
        emailMessage    <- map["Message.Email.0"]
        token           <- map["UserData.Token"]
        userId          <- map["UserData.UserID"]
        employee_id     <- map["UserData.Data.employee_id"]
        first_name      <- map["UserData.Data.first_name"]
        last_name       <- map["UserData.Data.last_name"]
        email           <- map["UserData.Data.email"]
        role_name       <- map["UserData.Data.role_name"]
    }
    
}

class forgotPass: Mappable{
    var status: String?
    var message: String?
    
    
    required init?(map: Map) {
        
        
    }
    // Mappable
    func mapping(map: Map) {
        status  <- map["Status"]
        message <- map["Message"]
    }
}

class attendeList: Mappable{
    var TotalData: Int?
    var TotalPage: Int?
    var attendeDataList: [attendeData]?
    
    
    required init?(map: Map) {
        
        
    }
    // Mappable
    func mapping(map: Map) {
        TotalData       <- map["TotalData"]
        TotalPage       <- map["TotalPage"]
        attendeDataList <- map["Data"]
    }
}

class attendeData: Mappable {
    var attendanceid: String?
    var checkin: String?
    var checkout: String?
    var status_late: String?
    var status_working: String?
    var hours_different: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        attendanceid    <- map["attendanceid"]
        checkin         <- map["checkin"]
        checkout        <- map["checkout"]
        status_late     <- map["status_late"]
        status_working  <- map["status_working"]
        hours_different <- map["hours_different"]
    }
}
