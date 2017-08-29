//
//  API.swift
//  workforce
//
//  Created by admin on 7/28/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class APIManager{
    static let sharedAPI = APIManager()
    
    func getTopViewController() -> UIViewController?{
        if var topController = UIApplication.shared.keyWindow?.rootViewController
        {
            while (topController.presentedViewController != nil)
            {
                topController = topController.presentedViewController!
            }
            return topController
        }
        return nil
    }
    
    
    func handleForgotPass(email: String){
        let emailParameter: Parameters = [
            "email_target": email
        ]
        Alamofire.request("http://staging.api.workforce.id/api/v1/user/forgotPassword", method: .post, parameters: emailParameter).responseObject { (response : DataResponse<forgotPass>) in
            let responseMsg = response.result.value
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                self.createAlert(titleText: "Succes", messageText: (responseMsg?.message)!)
            }else{
                self.createAlert(titleText: "Failure", messageText: (responseMsg?.status)!)
            }
        }
    }
    
    func handleCheckOut(token: String, absent_num: String, checkIn: String, callback: @escaping ()->Void){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarLog")
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeOut = dateFormatter.string(from: date)
        print(timeOut)
        
        guard let parameters: Parameters = [
            "token": token,
            "absent_number": absent_num,
            "date": currentDate,
            "checkin": checkIn,
            "checkout": timeOut,
            "attendance_type": "manualentry"
            ]
            else{
                return
        }
        Alamofire.request("http://staging.api.workforce.id/api/v1/attendance/update", method: .post, parameters: parameters).responseObject{ (response : DataResponse<User>) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                callback()
            }else{
                self.createAlert(titleText: "Error", messageText: "Authentication failed. You should log in first")
                UserDefaults.standard.removeObject(forKey: "userData")
                self.getTopViewController()?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func getTodayAttende(token: String, completeonClosure: @escaping (attendeList) -> Void){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: date)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarFirst")
        let parameters: Parameters = [
            "token": token,
            "Page": 1,
            "PageLimit": 30,
            "Search[0][field]": "date",
            "Search[0][condition]": "=",
            "Search[0][value1]": currentDate,
            "Search[0][value2]": ""
        ]
        
        Alamofire.request("http://staging.api.workforce.id/api/v1/attendance/manageoutgoingrequest", method: .post, parameters: parameters).responseObject{ (response : DataResponse<attendeList>) in
            let user = response.result.value
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                completeonClosure(user!)
            }else{
                self.createAlert(titleText: "Error", messageText: "You need to Log in First")
                UserDefaults.standard.removeObject(forKey: "userData")
                self.getTopViewController()?.present(vc, animated: true, completion: nil)
            }
        }
    }
    
    func handleCheckIn(token: String, absent_num: String, callback: @escaping () -> Void){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarLog")
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timeIn = dateFormatter.string(from: date)
        print(timeIn)
        guard let parameters: Parameters = [
            "token": token,
            "absent_number": absent_num,
            "date": currentDate,
            "checkin": timeIn,
            "checkout": currentDate + " 00:00:00",
            "attendance_type": "manualentry"
            ]
            else{
                return
            }
        Alamofire.request("http://staging.api.workforce.id/api/v1/attendance/update", method: .post, parameters: parameters).responseObject{ (response : DataResponse<User>) in
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                callback()
            }else{
                self.createAlert(titleText: "Error", messageText: "Authentication failed. You should log in first")
                UserDefaults.standard.removeObject(forKey: "userData")
                self.getTopViewController()?.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func handleLogin(email: String, password: String){
        
        guard let parameters: Parameters = [
            "Email": email,
            "Password": password
            ]
            else{
                return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarLog")
        
        Alamofire.request("http://staging.api.workforce.id/api/v1/user/login", method: .post, parameters: parameters).responseObject{ (response : DataResponse<User>) in
            let user = response.result.value
            let JSONString = user?.toJSONString(prettyPrint: true)
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                UserDefaults.standard.set(JSONString, forKey: "userData")
                UserDefaults.standard.synchronize()
                
                self.getTopViewController()?.present(vc, animated: true, completion: nil)
                
            }else{
                self.handleLoginError(user: user)
            }
        }
    }
    
    
    
    func handleHolidayList(token: String, year: String, month: String, completeonClosure: @escaping (holidaysList) -> Void){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarFirst")
        let parameters: Parameters = [
            "token": token
        ]
        
        Alamofire.request("http://staging.api.workforce.id/api/v1/holiday/manage", method: .post, parameters: parameters).responseObject{ (response : DataResponse<holidaysList>) in
            let user = response.result.value
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                if user?.TotalData != 0 {
                    completeonClosure(user!)
                }else{
                    self.createAlert(titleText: "Error", messageText: "Data not found")
                }
                
            }else{
                self.createAlert(titleText: "Error", messageText: "Authentication failed. You should log in first")
                UserDefaults.standard.removeObject(forKey: "userData")
                self.getTopViewController()?.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func attendanceReport(token: String, year: String, month: String, completeonClosure: @escaping (attendeList) -> Void){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "tabBarFirst")
        let parameters: Parameters = [
            "token": token,
            "Page": 1,
            "PageLimit": 30,
            "Search[0][field]": "date",
            "Search[0][condition]": "between",
            "Search[0][value1]": year + "-" + month + "-01",
            "Search[0][value2]": year + "-" + month + "-31"
        ]
        
        Alamofire.request("http://staging.api.workforce.id/api/v1/attendance/manageoutgoingrequest", method: .post, parameters: parameters).responseObject{ (response : DataResponse<attendeList>) in
            let user = response.result.value
            let statusCode = response.response?.statusCode
            if statusCode == 200 {
                if user?.TotalData != 0 {
                    completeonClosure(user!)
                }else{
                    self.createAlert(titleText: "Error", messageText: "Data not found")
                }
                
            }else{
                self.createAlert(titleText: "Error", messageText: "Authentication failed. You should log in first")
                UserDefaults.standard.removeObject(forKey: "userData")
                self.getTopViewController()?.present(vc, animated: true, completion: nil)
            }
        }
        
    }
    
    func handleLoginError(user: User?){
        if user?.passMessage != nil && user?.emailMessage != nil{
            createAlert(titleText: "Login Failure", messageText: (user?.status)! + "\n" + (user?.emailMessage)! + "\n" + (user?.passMessage)!)
        }else if user?.emailMessage != nil {
            createAlert(titleText: "Login Failure", messageText: (user?.status)! + "\n" + (user?.emailMessage)!)
        }else if user?.passMessage != nil{
            createAlert(titleText: "Login Failure", messageText: (user?.status)! + "\n" + (user?.passMessage)!)
        }else{
            createAlert(titleText: "Login Failure", messageText: (user?.status)!)
        }
    }
    
    func createAlert(titleText: String, messageText: String){
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        let cancelOption = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        })
        cancelOption.setValue(UIColor.init(red: 42/255, green: 147/255, blue: 137/255, alpha: 1), forKey: "titleTextColor")
        alert.addAction(cancelOption)
        
        self.getTopViewController()?.present(alert, animated: true, completion:  nil)
    }
}
