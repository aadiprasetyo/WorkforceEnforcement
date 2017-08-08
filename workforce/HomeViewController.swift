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
import Floaty

class HomeViewController: UIViewController, FloatyDelegate{

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
    let months = ["January", "February", "March", "April","May", "June", "July", "August", "September", "October", "November", "December"]
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
    var floaty = Floaty()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let df = DateFormatter()
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var monthNumber: DateComponents?
        var monthNum: Int?
        
        dropDownYear.bottomOffset = CGPoint(x: 0, y: yearPicker.bounds.height)
        dropDownYear.anchorView = yearPicker
        dropDownYear.dataSource = years
        dropDownYear.selectionAction = { [unowned self] (index, item) in
            self.yearPicker.setTitle(item, for: .normal)
            
            let monthName = self.monthPicker.titleLabel?.text
            df.dateFormat = "LLLL"  // if you need 3 letter month just use "LLL"
            if let date = df.date(from: monthName!) {
                monthNumber  = calendar.dateComponents([.month], from: date)
                monthNum = monthNumber?.month
                self.attendeList(year: item, month: String(monthNum!))
            }
            
            
        }
        dropDownMonth.bottomOffset = CGPoint(x: 0, y: monthPicker.bounds.height)
        dropDownMonth.anchorView = monthPicker
        dropDownMonth.dataSource = months
        dropDownMonth.selectionAction = { [unowned self] (index, item) in
            self.monthPicker.setTitle(item, for: .normal)
            let yearNum = self.yearPicker.titleLabel?.text
            
            df.dateFormat = "LLLL"  // if you need 3 letter month just use "LLL"
            if let date = df.date(from: item) {
                monthNumber  = calendar.dateComponents([.month], from: date)
                monthNum = monthNumber?.month
                self.attendeList(year: yearNum!, month: String(monthNum!))
            }
        }
        
        self.parent?.title = "Home"
        
        userData = Mapper<User>().map(JSONString: UserDefaults.standard.object(forKey: "userData") as! String)
        setupCollectionView()
        view.addSubview(collectionViews)
        collectionViews.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        collectionViews.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        collectionViews.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/1.09).isActive = true
        collectionViews.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionViews.topAnchor.constraint(equalTo: DateContainer.bottomAnchor, constant: 10).isActive = true
        
        df.dateFormat = "LLLL"  // if you need 3 letter month just use "LLL"
        if let date = df.date(from: (monthPicker.titleLabel?.text)!) {
            monthNumber  = calendar.dateComponents([.month], from: date)
            monthNum = monthNumber?.month
            self.attendeList(year: (yearPicker.titleLabel?.text)!, month: String(monthNum!))
        }
        
        layoutFAB()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func customImageSwitched(_ sender: UISwitch) {
        if sender.isOn == true {
            floaty.buttonImage = UIImage(named: "plus")
        } else {
            floaty.buttonImage = nil
        }
    }
    
    func layoutFAB() {
        floaty.buttonColor = UIColor(red: 4/255, green: 166/255, blue: 83/255, alpha: 1)
        floaty.plusColor = UIColor.white
        let checkIn = FloatyItem()
        checkIn.buttonColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1)
        checkIn.icon = UIImage(named: "checkIn")
        checkIn.circleShadowColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        checkIn.titleShadowColor = UIColor.black
        checkIn.title = "Check In"
        checkIn.titleColor = UIColor.black
        checkIn.titleLabel.textAlignment = .center
        checkIn.titleLabel.font = UIFont.systemFont(ofSize: 8)
        checkIn.titleLabel.backgroundColor = UIColor.white
        checkIn.titleLabel.layer.masksToBounds = true
        checkIn.titleLabel.layer.cornerRadius = 4
        checkIn.handler = { item in
            print("check in")
        }
        
        let checkOut = FloatyItem()
        checkOut.buttonColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
        checkOut.icon = UIImage(named: "checkOut")
        checkOut.circleShadowColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        checkOut.titleShadowColor = UIColor.black
        checkOut.title = "Check Out"
        checkOut.titleColor = UIColor.black
        checkOut.titleLabel.textAlignment = .center
        checkOut.titleLabel.font = UIFont.systemFont(ofSize: 8)
        checkOut.titleLabel.backgroundColor = UIColor.white
        checkOut.titleLabel.layer.masksToBounds = true
        checkOut.titleLabel.layer.cornerRadius = 4
        checkOut.handler = { item in
            print("check out")
        }
        
        floaty.addItem(item: checkIn)
        floaty.addItem(item: checkOut)
        floaty.paddingX = self.view.frame.width/4.5 - floaty.frame.width
        floaty.paddingY = self.view.frame.height/5 - floaty.frame.height
        floaty.fabDelegate = self
        self.view.addSubview(floaty)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = "Home"
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
        collectionViews.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
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
                
                self.checkOut = [UILabel]()
                self.images =  [UIImage]()
                self.checkOut = [UILabel]()
                self.checkIn = [UILabel]()
                self.statusCheckOut = [UILabel]()
                self.statusCheckIn = [UILabel]()
                self.workHours = [UILabel]()
                
                for attendeData in attendeDataList {
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
                    self.images.append(UIImage(named: "groupCopy")!)
                    self.collectionViews.reloadData()
                }
            }
        }
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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        
        let dateCheckIn = dateFormatter.date(from: checkIn[indexPath.row].text!)
        let dateCheckOut = dateFormatter.date(from: checkOut[indexPath.row].text!)
        
        dateFormatter.dateFormat = "E, dd MMM yyyy - HH:mm"
        
        let checkInTime = dateFormatter.string(from: dateCheckIn!)
        let checkOutTime = dateFormatter.string(from: dateCheckOut!)
        
        let imageCell = cell as! attendanceCollectionViewCell
        imageCell.ImageView.image = images[indexPath.row]
        imageCell.checkOutTime.text = checkOutTime
        imageCell.checkInTime.text = checkInTime
        imageCell.statusCheckOut.text = statusCheckOut[indexPath.row].text?.uppercased()
        imageCell.statusCheckIn.text = statusCheckIn[indexPath.row].text?.uppercased()
        let numberWorks = Double(workHours[indexPath.row].text!)
        
        if statusCheckIn[indexPath.row].text == "no" {
            imageCell.statusCheckIn.text = "ON TIME"
            imageCell.statusCheckIn.backgroundColor = UIColor(red: 4/255, green: 166/255, blue: 83/255, alpha: 1)
        }else{
            imageCell.statusCheckIn.text = "LATE"
            imageCell.statusCheckIn.backgroundColor = UIColor(red: 255/255, green: 23/255, blue: 68/255, alpha: 1)
        }
        
        if numberWorks! >= 9{
            imageCell.workHours.textColor = UIColor(red: 42/255, green: 147/255, blue: 137/255, alpha: 1)
            imageCell.statusCheckOut.backgroundColor = UIColor(red: 4/255, green: 166/255, blue: 83/255, alpha: 1)
            
        }else{
            imageCell.workHours.textColor = UIColor(red: 255/255, green: 23/255, blue: 68/255, alpha: 1)
            imageCell.statusCheckOut.backgroundColor = UIColor(red: 255/255, green: 23/255, blue: 68/255, alpha: 1)
        }
        
        imageCell.workHours.text = "WORK HOURS " + String(format: "%.1f", numberWorks!)
    }
    //Set the size of cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionViews.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

