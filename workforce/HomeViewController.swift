//
//  HomeViewController.swift
//  workforce
//
//  Created by admin on 7/20/17.
//  Copyright © 2017 indosystem. All rights reserved.
//

import UIKit
import ObjectMapper
import DropDown

class HomeViewController: UIViewController{

    @IBOutlet weak var monthPicker: UIButton!
    @IBOutlet weak var yearPicker: UIButton!
    @IBOutlet weak var LineContainer: UIView!
    @IBOutlet weak var DateContainer: UIView!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var ServertimeContainer: UIView!
    @IBOutlet weak var ServertimeLabel: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    var collectionViews: UICollectionView!
    
    let years = ["2015", "2016", "2017"]
    let months = ["January", "February", "March", "April","May", "June", "July", "August", "September", "Octrober", "November", "December"]
    let dropDownYear = DropDown()
    let dropDownMonth = DropDown()
    
    
    
    @IBAction func chooseYear(_ sender: Any) {
        dropDownYear.show()
    }
    @IBAction func chooseMonth(_ sender: Any) {
        dropDownMonth.show()
    }
    
    
    var images =  [UIImage]()
    var checkOut = [UILabel]()
    var checkIn = [UILabel]()
    var statusCheckOut = [UILabel]()
    var statusCheckIn = [UILabel]()
    var workHours = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = DateComponents()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        
        dropDownYear.bottomOffset = CGPoint(x: 0, y: yearPicker.bounds.height)
        dropDownYear.anchorView = yearPicker
        dropDownYear.dataSource = years
        dropDownYear.selectionAction = { [unowned self] (index, item) in
            self.yearPicker.setTitle(item, for: .normal)
            print(item)
            let monthString = self.monthPicker.titleLabel?.text
            if let date = formatter.date(from: monthString!) {
                let month  = NSCalendar.current.component([.Month, .Day], from: monthString)
                print(month)  // 5
            }
            //self.attendeList(year: item, month: month)
        }
        
        dropDownMonth.bottomOffset = CGPoint(x: 0, y: monthPicker.bounds.height)
        dropDownMonth.anchorView = monthPicker
        dropDownMonth.dataSource = months
        dropDownMonth.selectionAction = { [unowned self] (index, item) in
            self.monthPicker.setTitle(item, for: .normal)
        }
        
        tabBarController?.navigationItem.title = "Home"
        userData = Mapper<User>().map(JSONString: UserDefaults.standard.object(forKey: "userData") as! String)
        setupCollectionView()
        view.addSubview(collectionViews)
        collectionViews.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        collectionViews.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        collectionViews.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.09).isActive = true
        collectionViews.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionViews.topAnchor.constraint(equalTo: DateContainer.bottomAnchor).isActive = true
        attendeList(year: "2016", month: "6")
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "Home"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionViews = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionViews.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 100, right: 0)
        collectionViews.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 0, bottom: 100, right: -10)
        collectionViews.register(attendanceCollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        collectionViews.delegate = self
        collectionViews.dataSource = self
        collectionViews.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        
    }
    
    func attendeList(year: String, month: String){
        APIManager.sharedAPI.attendanceReport(token: (userData?.token)!, year: year, month: month){
            Data in
            if let attendeDataList = Data.attendeDataList {
                
                for attendeData in attendeDataList {
                    print(attendeData.attendanceid)
                    print(attendeData.checkin)
                    print(attendeData.checkout)
                    print(attendeData.status_late)
                    print(attendeData.status_working)
                    print(attendeData.hours_different)
                    
                    let checkoutLabel = UILabel()
                    checkoutLabel.text = attendeData.checkout
                    
                    let checkinLabel = UILabel()
                    checkinLabel.text = attendeData.checkin
                    
                    let statuscheckoutLabel = UILabel()
                    statuscheckoutLabel.text = attendeData.status_working
                    
                    let statuscheckinLabel = UILabel()
                    statuscheckinLabel.text = attendeData.status_late
                    
                    let workhousLabel = UILabel()
                    workhousLabel.text = attendeData.hours_different
                    
                    self.checkOut.append(checkoutLabel)
                    self.checkIn.append(checkinLabel)
                    self.statusCheckOut.append(statuscheckoutLabel)
                    self.statusCheckIn.append(statuscheckinLabel)
                    self.workHours.append(workhousLabel)
                    self.addMoreImages()
                }
            }
        }
    }
    
    func addMoreImages(){
        images.append(UIImage(named: "groupCopy")!)
        collectionViews.reloadData()
    }
    func setupView(){
        DateContainer.translatesAutoresizingMaskIntoConstraints = false
        DateContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.7).isActive = true
        DateContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        DateContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        DateContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16.5).isActive = true
        DateContainer.backgroundColor = UIColor.white
        DateContainer.layer.borderWidth = 1
        DateContainer.layer.borderColor = UIColor.lightGray.cgColor
        DateContainer.layer.cornerRadius = 4
        
        YearLabel.translatesAutoresizingMaskIntoConstraints = false
        YearLabel.leftAnchor.constraint(equalTo: DateContainer.leftAnchor, constant: 19.1 ).isActive = true
        YearLabel.topAnchor.constraint(equalTo: DateContainer.topAnchor, constant: 7).isActive = true
        YearLabel.textColor = UIColor.gray
        
        
        yearPicker.translatesAutoresizingMaskIntoConstraints = false
        yearPicker.leftAnchor.constraint(equalTo: DateContainer.leftAnchor, constant: 19.1 ).isActive = true
        yearPicker.topAnchor.constraint(equalTo: YearLabel.topAnchor, constant: 7).isActive = true
        
        MonthLabel.translatesAutoresizingMaskIntoConstraints = false
        MonthLabel.leftAnchor.constraint(equalTo: LineContainer.rightAnchor, constant: 18.5 ).isActive = true
        MonthLabel.topAnchor.constraint(equalTo: DateContainer.topAnchor, constant: 7).isActive = true
        MonthLabel.textColor = UIColor.gray
        
        
        monthPicker.translatesAutoresizingMaskIntoConstraints = false
        monthPicker.leftAnchor.constraint(equalTo: LineContainer.rightAnchor, constant: 18.5 ).isActive = true
        monthPicker.topAnchor.constraint(equalTo: MonthLabel.topAnchor, constant: 7).isActive = true
        
        ServertimeContainer.translatesAutoresizingMaskIntoConstraints = false
        ServertimeContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3.2).isActive = true
        ServertimeContainer.heightAnchor.constraint(equalToConstant: 53).isActive = true
        ServertimeContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
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
        imageBackground.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
        LineContainer.translatesAutoresizingMaskIntoConstraints = false
        LineContainer.widthAnchor.constraint(equalToConstant: 1).isActive = true
        LineContainer.heightAnchor.constraint(equalTo: DateContainer.heightAnchor, multiplier: 1/1.6).isActive = true
        LineContainer.centerYAnchor.constraint(equalTo: DateContainer.centerYAnchor).isActive = true
        LineContainer.leftAnchor.constraint(equalTo: YearLabel.rightAnchor, constant: 63).isActive = true
        LineContainer.backgroundColor = UIColor.gray
    }
    
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    //Specifying the number of sections in the Collection View
    func numberOfSections(in collectionView: UICollectionView)-> Int {
        return 1
    }
    //Specifying the number of cells in the Collection View
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return images.count
    }
    //Method to dequeue the cell and set it up
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! attendanceCollectionViewCell
        cell.awakeFromNib()
        cell.delegate = self as? attendanceCollectionViewCellDelegate
        return cell
    }
    //Method to populate the data of a given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageCell = cell as! attendanceCollectionViewCell
        imageCell.ImageView.image = images[indexPath.row]
        imageCell.checkOutTime.text = checkOut[indexPath.row].text
        imageCell.checkInTime.text = checkIn[indexPath.row].text
        imageCell.statusCheckOut.text = statusCheckOut[indexPath.row].text
        imageCell.statusCheckIn.text = statusCheckIn[indexPath.row].text
        imageCell.workHours.text = imageCell.workHours.text! + workHours[indexPath.row].text!
    }
    //Set the size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViews.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

