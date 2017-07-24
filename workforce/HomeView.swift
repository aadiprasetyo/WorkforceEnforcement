//
//  HomeView.swift
//  workforce
//
//  Created by admin on 7/24/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit


extension HomeViewController {
    
    func setupView(){
        
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
        DateContainer.backgroundColor = UIColor.white
        DateContainer.layer.borderWidth = 1
        DateContainer.layer.borderColor = UIColor.lightGray.cgColor
        DateContainer.layer.cornerRadius = 4
        
        YearLabel.translatesAutoresizingMaskIntoConstraints = false
        //        YearLabel.widthAnchor.constraint(equalToConstant: 53.5).isActive = true
        //        YearLabel.heightAnchor.constraint(equalTo: DateContainer.heightAnchor).isActive = true
        YearLabel.leftAnchor.constraint(equalTo: DateContainer.leftAnchor, constant: 19.1 ).isActive = true
        YearLabel.topAnchor.constraint(equalTo: DateContainer.topAnchor, constant: 7).isActive = true
        YearLabel.textColor = UIColor.gray
        
        MonthLabel.translatesAutoresizingMaskIntoConstraints = false
        MonthLabel.rightAnchor.constraint(equalTo: DateContainer.rightAnchor, constant: -54 ).isActive = true
        MonthLabel.topAnchor.constraint(equalTo: DateContainer.topAnchor, constant: 7).isActive = true
        MonthLabel.textColor = UIColor.gray
        
        
        
        
        
        
        ServertimeContainer.translatesAutoresizingMaskIntoConstraints = false
        ServertimeContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3.2).isActive = true
        ServertimeContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        ServertimeContainer.topAnchor.constraint(equalTo: containerNav.bottomAnchor, constant: 8).isActive = true
        ServertimeContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -13.5).isActive = true
        ServertimeContainer.backgroundColor = UIColor.white
        ServertimeContainer.layer.borderWidth = 1
        ServertimeContainer.layer.borderColor = UIColor.lightGray.cgColor
        ServertimeContainer.layer.cornerRadius = 4
        
        ServertimeLabel.translatesAutoresizingMaskIntoConstraints = false
        ServertimeLabel.leftAnchor.constraint(equalTo: ServertimeContainer.leftAnchor, constant: 5 ).isActive = true
        ServertimeLabel.topAnchor.constraint(equalTo: ServertimeContainer.topAnchor, constant: 6.5 ).isActive = true
        ServertimeLabel.textColor = UIColor.gray
        
        
        imageBackground.translatesAutoresizingMaskIntoConstraints = false
        imageBackground.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageBackground.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        BorderHome.translatesAutoresizingMaskIntoConstraints = false
        BorderHome.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        BorderHome.heightAnchor.constraint(equalToConstant: 1).isActive = true
        BorderHome.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -49).isActive = true
        BorderHome.backgroundColor = UIColor.gray
        
        
        
        LineContainer.translatesAutoresizingMaskIntoConstraints = false
        LineContainer.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        //        LineContainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        LineContainer.heightAnchor.constraint(equalTo: DateContainer.heightAnchor, multiplier: 1/1.6).isActive = true
        LineContainer.centerYAnchor.constraint(equalTo: DateContainer.centerYAnchor).isActive = true
        LineContainer.leftAnchor.constraint(equalTo: YearLabel.rightAnchor, constant: 63).isActive = true
        LineContainer.backgroundColor = UIColor.gray
    }
    
    
    
    

}
