//
//  File.swift
//  workforce
//
//  Created by admin on 7/25/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
extension UIViewController{
    
    
    class imageBackground: UIImageView {
        override func awakeFromNib() {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            self.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        }
    }
    
}

