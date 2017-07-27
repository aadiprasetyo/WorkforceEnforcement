//
//  UIView.swift
//  workforce
//
//  Created by admin on 7/26/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

extension UIViewController {
    func createAlert(titleText: String, messageText: String){
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        let cancelOption = UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        })
        cancelOption.setValue(UIColor.init(red: 42/255, green: 147/255, blue: 137/255, alpha: 1), forKey: "titleTextColor")
        alert.addAction(cancelOption)
        
        self.present(alert, animated: true, completion:  nil)
    }
}
