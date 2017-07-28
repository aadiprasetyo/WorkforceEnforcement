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
    
    override func awakeFromNib() {
        ImageView = UIImageView(frame: contentView.frame)
        ImageView.contentMode = .scaleAspectFit
        contentView.addSubview(ImageView)
    }
    
}
