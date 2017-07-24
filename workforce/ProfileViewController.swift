//
//  ProfileViewController.swift
//  workforce
//
//  Created by admin on 7/21/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    

    @IBOutlet weak var headerNav: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var SubHeaderNav: UIView!
    @IBOutlet weak var BorderHome: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    
    
    @IBOutlet weak var LaporanButton: UIButton!
    @IBOutlet weak var LaporanTextButton: UIButton!
    
    @IBOutlet weak var SettingsButton: UIButton!
    
    @IBOutlet weak var SettingsTextButton: UIButton!
    
    
    @IBOutlet weak var LogoutButton: UIButton!
    @IBOutlet weak var LogoutTextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageBackground.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        headerNav.translatesAutoresizingMaskIntoConstraints = false
        headerNav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerNav.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerNav.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        SubHeaderNav.translatesAutoresizingMaskIntoConstraints = false
        SubHeaderNav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        SubHeaderNav.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        SubHeaderNav.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2.11).isActive = true
        SubHeaderNav.layer.cornerRadius = 50
        
        
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: headerNav.bottomAnchor, constant: -14).isActive = true
        labelTitle.font = UIFont.boldSystemFont(ofSize: 12)
        
        
        
        BorderHome.translatesAutoresizingMaskIntoConstraints = false
        BorderHome.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        BorderHome.heightAnchor.constraint(equalToConstant: 1).isActive = true
        BorderHome.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -49).isActive = true
        BorderHome.backgroundColor = UIColor.gray
        
        
        LaporanButton.translatesAutoresizingMaskIntoConstraints = false
        LaporanButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/4.5).isActive = true
        LaporanButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/10.6 ).isActive = true
        LaporanButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7.5 ).isActive = true
    LaporanButton.topAnchor.constraint(equalTo: SubHeaderNav.bottomAnchor, constant: 5.5).isActive = true
        LaporanButton.layer.cornerRadius = 4
        
        LaporanTextButton.translatesAutoresizingMaskIntoConstraints = false
        LaporanTextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.35).isActive = true
        LaporanTextButton.heightAnchor.constraint(equalTo: LaporanButton.heightAnchor).isActive = true
        LaporanTextButton.leftAnchor.constraint(equalTo: LaporanButton.rightAnchor).isActive = true
        LaporanTextButton.topAnchor.constraint(equalTo: LaporanButton.topAnchor).isActive = true
        LaporanTextButton.layer.cornerRadius = 4
        LaporanTextButton.layer.shadowColor = UIColor.gray.cgColor
        LaporanTextButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        LaporanTextButton.layer.shadowRadius = 0.4
        LaporanTextButton.layer.shadowOpacity = 0.2
        
        
        
        
        SettingsButton.translatesAutoresizingMaskIntoConstraints = false
        SettingsButton.widthAnchor.constraint(equalToConstant: 83).isActive = true
        SettingsButton.heightAnchor.constraint(equalTo: LaporanButton.heightAnchor).isActive = true
        SettingsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7.5).isActive = true
        SettingsButton.topAnchor.constraint(equalTo: LaporanButton.bottomAnchor, constant: 5.2 ).isActive = true
        SettingsButton.layer.cornerRadius = 4
        
        SettingsTextButton.translatesAutoresizingMaskIntoConstraints = false
        SettingsTextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.35).isActive = true
        SettingsTextButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        SettingsTextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 7.5).isActive = true
        SettingsTextButton.topAnchor.constraint(equalTo: LaporanTextButton.bottomAnchor, constant: 5.2).isActive = true
        SettingsTextButton.layer.cornerRadius = 4
        
        LogoutButton.translatesAutoresizingMaskIntoConstraints = true
        LogoutButton.widthAnchor.constraint(equalToConstant: 83).isActive = true
        LogoutButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        LogoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 7.5).isActive = true
        LogoutButton.topAnchor.constraint(equalTo: SettingsButton.bottomAnchor, constant: 5.2).isActive = true
        LogoutButton.layer.cornerRadius = 4
        
        LogoutTextButton.translatesAutoresizingMaskIntoConstraints = false
        LogoutTextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.35).isActive = true
        LogoutTextButton.heightAnchor.constraint(equalToConstant: 63).isActive = true
        LogoutTextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 7.5).isActive = true
        LogoutTextButton.topAnchor.constraint(equalTo: SettingsTextButton.bottomAnchor, constant: 5.2).isActive = true
        LogoutTextButton.layer.cornerRadius = 4
        
        
        
//        
//        SettingsTextButton.translatesAutoresizingMaskIntoConstraints = false
//        SettingsTextButton.
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
  

}
