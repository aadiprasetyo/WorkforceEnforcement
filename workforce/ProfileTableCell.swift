//
//  UserCell.swift
//  GameOfChats
//
//  Created by admin on 7/17/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: 100, y: textLabel!.frame.origin.y, width: textLabel!.frame.width, height: textLabel!.frame.height)
        textLabel?.font = UIFont.systemFont(ofSize: 12)
        detailTextLabel?.frame = CGRect(x: 64, y: detailTextLabel!.frame.origin.y, width: detailTextLabel!.frame.width, height: detailTextLabel!.frame.height)
        detailTextLabel?.textColor = UIColor.gray
    }
    let detailLabel: UILabel = {
        let dl = UILabel()
        dl.font = UIFont.systemFont(ofSize: 12)
        dl.layer.masksToBounds = true
        dl.textColor = UIColor(red: 159/255, green: 159/255, blue: 166/255, alpha: 1)
        dl.translatesAutoresizingMaskIntoConstraints = false
        return dl
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(detailLabel)
        
        detailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        detailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        detailLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        detailLabel.heightAnchor.constraint(equalTo: (textLabel?.heightAnchor)!).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
