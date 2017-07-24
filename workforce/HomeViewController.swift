//
//  HomeViewController.swift
//  workforce
//
//  Created by admin on 7/20/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var LineContainer: UIView!
    @IBOutlet weak var BorderHome: UIView!
    @IBOutlet weak var DateContainer: UIView!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var ServertimeContainer: UIView!
    @IBOutlet weak var ServertimeLabel: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var containerNav: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleLogout(){
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
