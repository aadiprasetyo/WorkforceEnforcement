//
//  LoginViewController.swift
//  workforce
//
//  Created by admin on 7/19/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class forgotPassViewController: UIViewController {
    
    @IBOutlet weak var inputsContainerView: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var emailSeparator: UIView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoWE: UIImageView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func forgotButton(_ sender: Any) {
        handleForgotPass()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputsContainerView()
        navigationItem.title = "Forgot Password"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleForgotPass(){
        let emailParameter: Parameters = [
            "email_target": emailTextField.text!
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
    
}

