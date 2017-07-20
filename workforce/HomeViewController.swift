//
//  HomeViewController.swift
//  workforce
//
//  Created by admin on 7/20/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
        
        
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageBackground.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        
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
