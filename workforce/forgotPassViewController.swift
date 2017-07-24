//
//  LoginViewController.swift
//  workforce
//
//  Created by admin on 7/19/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class forgotPassViewController: UIViewController {
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var inputsContainerView: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var emailSeparator: UIView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoWE: UIImageView!
    @IBOutlet weak var headerContainer: UIView!
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
    
    
}
extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layer.mask = maskLayer
    }
}
