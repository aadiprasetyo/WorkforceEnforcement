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
    var profile = [userData?.first_name, userData?.email, userData?.role_name]
    var profileDetail = ["Name", "Email", "Job"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        self.title = "View Profile"
        profileTable.register(ProfileCell.self, forCellReuseIdentifier: "cell")
        setupView()
        profileTable.delegate = self
        profileTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileCell
        cell.detailLabel.text = profileDetail[indexPath.row]
        cell.textLabel?.text = profile[indexPath.row]
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "View Profile"
        profileJob.text = userData?.role_name
        profileName.text = (userData?.first_name)! + (userData?.last_name)!
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
