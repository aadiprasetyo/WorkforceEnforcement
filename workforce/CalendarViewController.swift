//
//  CalendarViewController.swift
//  workforce
//
//  Created by admin on 7/26/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationItem.title = "Calendar"
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Calendar"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
