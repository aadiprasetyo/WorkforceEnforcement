//
//  ProfileViewController.swift
//  workforce
//
//  Created by admin on 7/21/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import ObjectMapper

class ProfileViewController: UIViewController {

    

    @IBOutlet weak var SubHeaderNav: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileJob: UILabel!
    @IBOutlet weak var viewProfile: UIButton!
    
    
    @IBOutlet weak var reportContainer: UIImageView!
    @IBOutlet weak var reportButtonContainer: UIButton!
    @IBOutlet weak var reportImage: UIImageView!
    @IBOutlet weak var reportLabel: UILabel!
    
    
    @IBAction func logout_Tap(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "userData")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController")
        self.show(vc!, sender: nil)
    }
    
    @IBOutlet weak var reportArrow: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tabBarController?.navigationItem.title = "Profile"
        setProfile()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Profile"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func setProfile(){
        profileJob.text = userData?.role_name
        profileName.text = (userData?.first_name)! + (userData?.last_name)!
    }
}

