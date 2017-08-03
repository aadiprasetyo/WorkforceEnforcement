//
//  attendanceCollectionView.swift
//  workforce
//
//  Created by admin on 7/28/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

protocol attendanceCollectionViewCellDelegate {
    func changeColorOfButton(forCell: attendanceCollectionViewCell)
}
class attendanceCollectionViewCell: UICollectionViewCell {
    
    var ImageView: UIImageView!
    var button: UIButton!
    var delegate: attendanceCollectionViewCellDelegate? = nil
    let statusCheckIn:UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    let statusCheckOut:UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    let checkInTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkOutTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let workHours: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func awakeFromNib() {
        
        
        
        ImageView = UIImageView(frame: contentView.frame)
        ImageView.contentMode = .scaleAspectFit
        contentView.addSubview(ImageView)
        contentView.addSubview(statusCheckIn)
        contentView.addSubview(statusCheckOut)
        contentView.addSubview(checkInTime)
        contentView.addSubview(checkOutTime)
        contentView.addSubview(workHours)
        
        statusCheckIn.text = "LUL"
        statusCheckIn.font = UIFont.systemFont(ofSize: 12)
        statusCheckIn.textAlignment = .center
        statusCheckIn.backgroundColor = UIColor(red: 4/255, green: 166/255, blue: 83/255, alpha: 1)
        statusCheckIn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56.5).isActive = true
        statusCheckIn.widthAnchor.constraint(equalToConstant: 97.5).isActive = true
        statusCheckIn.heightAnchor.constraint(equalToConstant: 22.5).isActive = true
        statusCheckIn.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8.3).isActive = true
        statusCheckIn.layer.masksToBounds = true
        statusCheckIn.layer.cornerRadius = 2

        checkInTime.text = "haHAA"
        checkInTime.textColor = UIColor.gray
        checkInTime.font = UIFont.systemFont(ofSize: 12)
        checkInTime.bottomAnchor.constraint(equalTo: statusCheckIn.topAnchor, constant: -6.5).isActive = true
        checkInTime.widthAnchor.constraint(equalToConstant: 137.5).isActive = true
        checkInTime.heightAnchor.constraint(equalToConstant: 12).isActive = true
        checkInTime.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8.3).isActive = true
        
        statusCheckOut.text = "XD"
        statusCheckOut.textAlignment = .center
        statusCheckOut.backgroundColor = UIColor(red: 255/255, green: 23/255, blue: 68/255, alpha: 1)
        statusCheckOut.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56.5).isActive = true
        statusCheckOut.widthAnchor.constraint(equalToConstant: 97.5).isActive = true
        statusCheckOut.heightAnchor.constraint(equalToConstant: 22.5).isActive = true
        statusCheckOut.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7.8).isActive = true
        statusCheckOut.layer.masksToBounds = true
        statusCheckOut.layer.cornerRadius = 2
        
        checkOutTime.text = "haHAA"
        checkOutTime.textColor = UIColor.gray
        checkOutTime.font = UIFont.systemFont(ofSize: 12)
        checkOutTime.bottomAnchor.constraint(equalTo: statusCheckIn.topAnchor, constant: -6.5).isActive = true
        checkOutTime.widthAnchor.constraint(equalToConstant: 137.5).isActive = true
        checkOutTime.heightAnchor.constraint(equalToConstant: 12).isActive = true
        checkOutTime.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7.8).isActive = true
        
        workHours.text = "WORK HOURS "
        workHours.textColor = UIColor.green
        workHours.textAlignment = .center
        workHours.font = UIFont.systemFont(ofSize: 12)
        workHours.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19).isActive = true
        workHours.widthAnchor.constraint(equalToConstant: 197.5).isActive = true
        workHours.heightAnchor.constraint(equalToConstant: 12).isActive = true
        workHours.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
    }
    
}
