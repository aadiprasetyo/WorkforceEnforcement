//
//  ProfileEditViewController.swift
//  workforce
//
//  Created by admin on 7/24/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var profileTable: UITableView!
    @IBOutlet weak var profileJob: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var SubHeaderNav: UIView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.title = "View Profile"
        profileTable.register(ProfileCell.self, forCellReuseIdentifier: "cell")
        setupView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "cell")
        cell.textLabel?.text = "haha"
        return cell
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupView(){
        SubHeaderNav.translatesAutoresizingMaskIntoConstraints = false
        SubHeaderNav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        SubHeaderNav.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        SubHeaderNav.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        SubHeaderNav.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2.11).isActive = true
        SubHeaderNav.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 50)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 104).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 104).isActive = true
        profileImage.layer.cornerRadius = 52
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 13.3).isActive = true
        profileName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        profileJob.translatesAutoresizingMaskIntoConstraints = false
        profileJob.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 9.5).isActive = true
        profileJob.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.topAnchor.constraint(equalTo: profileJob.bottomAnchor, constant: 8).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 104).isActive = true
        saveButton.layer.cornerRadius = 4

    }
}
