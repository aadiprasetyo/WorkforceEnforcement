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
    var absent_number: String?
    
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
        absent_number   <- map["UserData.Data.absent_number"]

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
    var attendanceid: Int?
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


class holidaysList: Mappable {
    var status: String?
    var TotalData: Int?
    var dataList: [holidayData]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        status      <- map["Status"]
        TotalData   <- map["TotalData"]
        dataList    <- map["Data"]
    }
}

class holidayData: Mappable {
    var holiday_id: Int?
    var year: Int?
    var date_start: String?
    var date_end: String?
    var holidayName: String?
    var holidayDesc: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        holiday_id  <- map["holiday_calendar_id"]
        year        <- map["year"]
        date_start  <- map["date_start"]
        date_end    <- map["date_end"]
        holidayName <- map["name"]
        holidayDesc <- map["description"]
    }
}
