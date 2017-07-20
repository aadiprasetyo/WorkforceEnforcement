//
//  HomeViewController.swift
//  workforce
//
//  Created by admin on 7/20/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    @IBOutlet weak var HomeButton: UIView!
    @IBOutlet weak var HomeImageButton: UIImageView!
    @IBOutlet weak var HomeLabel: UILabel!
    
    @IBOutlet weak var CalendarButton: UIView!
    @IBOutlet weak var CalendarImageButton: UIImageView!
    @IBOutlet weak var CalendarLabel: UILabel!
    
    @IBOutlet weak var ProfileButton: UIView!
    @IBOutlet weak var ProfileImageButton: UIImageView!
    @IBOutlet weak var ProfileLabel: UILabel!
    

 
  
    
    @IBOutlet weak var ContainerButtons: UIView!
    @IBOutlet weak var BorderHome: UIView!
    @IBOutlet weak var DateContainer: UIView!
    @IBOutlet weak var ServertimeContainer: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var containerNav: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerNav.translatesAutoresizingMaskIntoConstraints = false
        containerNav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerNav.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerNav.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: containerNav.bottomAnchor, constant: -14).isActive = true
        labelTitle.font = UIFont.boldSystemFont(ofSize: 12)
        
        DateContainer.translatesAutoresizingMaskIntoConstraints = false
        DateContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.7).isActive = true
    DateContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        DateContainer.topAnchor.constraint(equalTo: containerNav.bottomAnchor, constant: 8).isActive = true
        DateContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.5).isActive = true

        ServertimeContainer.translatesAutoresizingMaskIntoConstraints = false
        ServertimeContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3.2).isActive = true
        ServertimeContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        ServertimeContainer.topAnchor.constraint(equalTo: containerNav.bottomAnchor, constant: 8).isActive = true
        ServertimeContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -13.5).isActive = true
        
        
        
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageBackground.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        ContainerButtons.translatesAutoresizingMaskIntoConstraints = false
        ContainerButtons.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        ContainerButtons.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ContainerButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        BorderHome.translatesAutoresizingMaskIntoConstraints = false
        BorderHome.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        BorderHome.heightAnchor.constraint(equalToConstant: 1).isActive = true
        BorderHome.bottomAnchor.constraint(equalTo: ContainerButtons.topAnchor).isActive = true
        BorderHome.backgroundColor = UIColor.gray
        
        HomeButton.translatesAutoresizingMaskIntoConstraints = false
        HomeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        HomeButton.heightAnchor.constraint(equalTo: ContainerButtons.heightAnchor).isActive = true
        HomeButton.leftAnchor.constraint(equalTo: ContainerButtons.leftAnchor, constant: 46.5 ).isActive = true
        HomeButton.bottomAnchor.constraint(equalTo: ContainerButtons.bottomAnchor).isActive = true
       
     
        
        HomeImageButton.translatesAutoresizingMaskIntoConstraints = false
        HomeImageButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        HomeImageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        HomeImageButton.centerXAnchor.constraint(equalTo: HomeButton.centerXAnchor).isActive = true
        HomeImageButton.topAnchor.constraint(equalTo: HomeButton.topAnchor).isActive = true
        
        HomeLabel.translatesAutoresizingMaskIntoConstraints = false
        HomeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    HomeLabel.heightAnchor.constraint(equalTo: ContainerButtons.heightAnchor).isActive = true
        HomeLabel.leftAnchor.constraint(equalTo: ContainerButtons.leftAnchor, constant: 46.5 ).isActive = true
         HomeLabel.bottomAnchor.constraint(equalTo: ContainerButtons.bottomAnchor, constant: 18).isActive = true
        
        CalendarButton.translatesAutoresizingMaskIntoConstraints = false
        CalendarButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        CalendarButton.heightAnchor.constraint(equalTo: ContainerButtons.heightAnchor).isActive = true
        CalendarButton.centerXAnchor.constraint(equalTo: ContainerButtons.centerXAnchor).isActive = true
        CalendarButton.bottomAnchor.constraint(equalTo: ContainerButtons.bottomAnchor).isActive = true
//        CalendarButton.backgroundColor = UIColor.red
        
        CalendarImageButton.translatesAutoresizingMaskIntoConstraints = false
        CalendarImageButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        CalendarImageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        CalendarImageButton.centerXAnchor.constraint(equalTo: CalendarButton.centerXAnchor).isActive = true
        CalendarImageButton.topAnchor.constraint(equalTo: HomeButton.topAnchor).isActive = true
        
        CalendarLabel.translatesAutoresizingMaskIntoConstraints = false
        CalendarLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        CalendarLabel.heightAnchor.constraint(equalTo: ContainerButtons.heightAnchor).isActive = true
        CalendarLabel.centerXAnchor.constraint(equalTo: ContainerButtons.centerXAnchor).isActive = true
        CalendarLabel.bottomAnchor.constraint(equalTo: ContainerButtons.bottomAnchor, constant: 18).isActive = true
        
        ProfileButton.translatesAutoresizingMaskIntoConstraints = false
        ProfileButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ProfileButton.heightAnchor.constraint(equalTo: ContainerButtons.heightAnchor).isActive = true
        ProfileButton.rightAnchor.constraint(equalTo: ContainerButtons.rightAnchor, constant: -46.5 ).isActive = true
        ProfileButton.bottomAnchor.constraint(equalTo: ContainerButtons.bottomAnchor).isActive = true
//        ProfileButton.backgroundColor = UIColor.red
        
        
        
        ProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
    ProfileImageButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        ProfileImageButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        ProfileImageButton.centerXAnchor.constraint(equalTo: ProfileButton.centerXAnchor).isActive = true
        ProfileImageButton.topAnchor.constraint(equalTo: ProfileButton.topAnchor).isActive = true
        
        ProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        ProfileLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        ProfileLabel.heightAnchor.constraint(equalTo: ContainerButtons.heightAnchor).isActive = true
        ProfileLabel.rightAnchor.constraint(equalTo: ContainerButtons.rightAnchor, constant: -46.5 ).isActive = true
        ProfileLabel.bottomAnchor.constraint(equalTo: ContainerButtons.bottomAnchor, constant: 18).isActive = true
        
        
        
        
        
        
        
        
 
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLogout(){
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
