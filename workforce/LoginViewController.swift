//
//  LoginViewController.swift
//  workforce
//
//  Created by admin on 7/19/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var inputsContainerView: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var emailSeparator: UIView!
    @IBOutlet weak var passwordSeparator: UIView!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoWE: UIImageView!
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputsContainerView()
        loginButton.layer.shadowOpacity = 0.3
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var inputsContainerHeightAnchor: NSLayoutConstraint?
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    
   

}
