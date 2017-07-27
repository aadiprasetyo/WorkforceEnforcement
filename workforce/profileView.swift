//
//  profileView.swift
//  workforce
//
//  Created by admin on 7/25/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit


extension ProfileViewController {
    
    func setupView(){
        
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageBackground.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        SubHeaderNav.translatesAutoresizingMaskIntoConstraints = false
        SubHeaderNav.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        SubHeaderNav.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
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
        
        viewProfile.translatesAutoresizingMaskIntoConstraints = false
        viewProfile.topAnchor.constraint(equalTo: profileJob.bottomAnchor, constant: 8).isActive = true
        viewProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewProfile.widthAnchor.constraint(equalToConstant: 104).isActive = true
        viewProfile.layer.cornerRadius = 4
        
        
    }
}
