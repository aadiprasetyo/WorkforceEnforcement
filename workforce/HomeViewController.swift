//
//  HomeViewController.swift
//  workforce
//
//  Created by admin on 7/20/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import ObjectMapper

class HomeViewController: UIViewController {

    @IBOutlet weak var LineContainer: UIView!
    @IBOutlet weak var DateContainer: UIView!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var ServertimeContainer: UIView!
    @IBOutlet weak var ServertimeLabel: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        tabBarController?.navigationItem.title = "Home"
        userData = Mapper<User>().map(JSONString: UserDefaults.standard.object(forKey: "userData") as! String)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Home"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
