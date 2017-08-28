//
//  AttendanceReportController.swift
//  workforce
//
//  Created by admin on 8/24/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class AttendanceReportController: UIViewController {
    
    
    @IBOutlet weak var servertimeContainer: UIView!
    @IBOutlet weak var servertimeLabel: UILabel!
    @IBOutlet weak var yearmonthContainer: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearmonthLine: UIView!
    @IBOutlet weak var attendanceContainer: UIView!
    @IBOutlet weak var attendanceLabel: UILabel!
    @IBOutlet weak var cutiContainer: UIView!
    @IBOutlet weak var cutiLabel: UILabel!
    
    @IBOutlet weak var terlambatContainer: UIView!
    @IBOutlet weak var terlambatLabel: UILabel!
    
    @IBOutlet weak var hadirContainer: UIView!
    @IBOutlet weak var hadirLabel: UILabel!
    
    @IBOutlet weak var nilaiCuti: UILabel!
    @IBOutlet weak var nilaiTerlambat: UILabel!
    @IBOutlet weak var nilaiHadir: UILabel!
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        attendaceReport()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupView(){
        
        yearmonthContainer.translatesAutoresizingMaskIntoConstraints = false
        yearmonthContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.7).isActive = true
        yearmonthContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        yearmonthContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        yearmonthContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.5).isActive = true
        yearmonthContainer.backgroundColor = UIColor.white
        yearmonthContainer.layer.borderWidth = 1
        yearmonthContainer.layer.borderColor = UIColor.lightGray.cgColor
        yearmonthContainer.layer.cornerRadius = 4
        
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.leftAnchor.constraint(equalTo: yearmonthContainer.leftAnchor, constant: 19.1 ).isActive = true
        yearLabel.topAnchor.constraint(equalTo: yearmonthContainer.topAnchor, constant: 7).isActive = true
        yearLabel.textColor = UIColor.gray
        
        yearmonthLine.translatesAutoresizingMaskIntoConstraints = false
        yearmonthLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        yearmonthLine.heightAnchor.constraint(equalTo: yearmonthContainer.heightAnchor, multiplier: 1/1.6).isActive = true
        yearmonthLine.centerYAnchor.constraint(equalTo: yearmonthContainer.centerYAnchor).isActive = true
        yearmonthLine.leftAnchor.constraint(equalTo: yearLabel.rightAnchor, constant: 63).isActive = true
        yearmonthLine.backgroundColor = UIColor.gray
        
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        monthLabel.leftAnchor.constraint(equalTo: yearmonthLine.rightAnchor, constant: 18.5 ).isActive = true
        monthLabel.topAnchor.constraint(equalTo: yearmonthContainer.topAnchor, constant: 7).isActive = true
        monthLabel.textColor = UIColor.gray
        
        servertimeContainer.translatesAutoresizingMaskIntoConstraints = false
        servertimeContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3.2).isActive = true
        servertimeContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        servertimeContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        servertimeContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -13.5).isActive = true
        servertimeContainer.backgroundColor = UIColor.white
        servertimeContainer.layer.borderWidth = 1
        servertimeContainer.layer.borderColor = UIColor.lightGray.cgColor
        servertimeContainer.layer.cornerRadius = 4
        
        servertimeLabel.translatesAutoresizingMaskIntoConstraints = false
        servertimeLabel.leftAnchor.constraint(equalTo: servertimeContainer.leftAnchor, constant: 5 ).isActive = true
        servertimeLabel.topAnchor.constraint(equalTo: servertimeContainer.topAnchor, constant: 6.5 ).isActive = true
        servertimeLabel.textColor = UIColor.gray

        
        
        
        
        
        
    }
    
    func attendaceReport(){
        
        attendanceContainer.translatesAutoresizingMaskIntoConstraints = false
        attendanceContainer.backgroundColor = UIColor.white
        attendanceContainer.layer.borderWidth = 0.5
        attendanceContainer.layer.borderColor = UIColor.lightGray.cgColor
        attendanceContainer.layer.cornerRadius = 4
        
        cutiContainer.translatesAutoresizingMaskIntoConstraints = false
        cutiContainer.backgroundColor = UIColor.white
    
        cutiLabel.translatesAutoresizingMaskIntoConstraints = false
        cutiLabel.widthAnchor.constraint(equalTo: cutiContainer.widthAnchor, multiplier: 1/2).isActive = true
        cutiLabel.heightAnchor.constraint(equalTo: cutiContainer.heightAnchor).isActive = true
            
        cutiLabel.topAnchor.constraint(equalTo: cutiContainer.topAnchor).isActive = true
        cutiLabel.leftAnchor.constraint(equalTo: cutiContainer.leftAnchor).isActive = true
        cutiLabel.layer.borderWidth = 0.5
        cutiLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        nilaiCuti.translatesAutoresizingMaskIntoConstraints = false
        nilaiCuti.widthAnchor.constraint(equalTo: cutiContainer.widthAnchor, multiplier: 1/2).isActive = true
        nilaiCuti.heightAnchor.constraint(equalTo: cutiContainer.heightAnchor).isActive = true
        
        nilaiCuti.topAnchor.constraint(equalTo: cutiContainer.topAnchor).isActive = true
        nilaiCuti.rightAnchor.constraint(equalTo: cutiContainer.rightAnchor).isActive = true
        nilaiCuti.layer.borderWidth = 0.5
        nilaiCuti.layer.borderColor = UIColor.lightGray.cgColor
        


        
        
        terlambatContainer.translatesAutoresizingMaskIntoConstraints = false
        terlambatContainer.backgroundColor = UIColor.white
      
        terlambatLabel.translatesAutoresizingMaskIntoConstraints = false
        terlambatLabel.widthAnchor.constraint(equalTo: terlambatContainer.widthAnchor, multiplier: 1/2).isActive = true
        terlambatLabel.heightAnchor.constraint(equalTo: terlambatContainer.heightAnchor).isActive = true
        
        terlambatLabel.topAnchor.constraint(equalTo: terlambatContainer.topAnchor).isActive = true
        terlambatLabel.leftAnchor.constraint(equalTo: terlambatContainer.leftAnchor).isActive = true
        terlambatLabel.layer.borderWidth = 0.5
        terlambatLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        nilaiTerlambat.translatesAutoresizingMaskIntoConstraints = false
        nilaiTerlambat.widthAnchor.constraint(equalTo: terlambatContainer.widthAnchor, multiplier: 1/2).isActive = true
        nilaiTerlambat.heightAnchor.constraint(equalTo: terlambatContainer.heightAnchor).isActive = true
        
        nilaiTerlambat.topAnchor.constraint(equalTo: terlambatContainer.topAnchor).isActive = true
        nilaiTerlambat.rightAnchor.constraint(equalTo: terlambatContainer.rightAnchor).isActive = true
        nilaiTerlambat.layer.borderWidth = 0.5
        nilaiTerlambat.layer.borderColor = UIColor.lightGray.cgColor
        
        
        hadirContainer.translatesAutoresizingMaskIntoConstraints = false
        hadirContainer.backgroundColor = UIColor.white

        
        hadirLabel.translatesAutoresizingMaskIntoConstraints = false
        hadirLabel.widthAnchor.constraint(equalTo: hadirContainer.widthAnchor, multiplier: 1/2).isActive = true
        hadirLabel.heightAnchor.constraint(equalTo: hadirContainer.heightAnchor).isActive = true
        
        hadirLabel.topAnchor.constraint(equalTo: hadirContainer.topAnchor).isActive = true
        hadirLabel.leftAnchor.constraint(equalTo: hadirContainer.leftAnchor).isActive = true
        hadirLabel.layer.borderWidth = 0.5
        hadirLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        nilaiHadir.translatesAutoresizingMaskIntoConstraints = false
        nilaiHadir.widthAnchor.constraint(equalTo: hadirContainer.widthAnchor, multiplier: 1/2).isActive = true
        nilaiHadir.heightAnchor.constraint(equalTo: hadirContainer.heightAnchor).isActive = true
        
        nilaiHadir.topAnchor.constraint(equalTo: hadirContainer.topAnchor).isActive = true
        nilaiHadir.rightAnchor.constraint(equalTo: hadirContainer.rightAnchor).isActive = true
        nilaiHadir.layer.borderWidth = 0.5
        nilaiHadir.layer.borderColor = UIColor.lightGray.cgColor


    
  
        
        
        
        
        
        
    }

}
