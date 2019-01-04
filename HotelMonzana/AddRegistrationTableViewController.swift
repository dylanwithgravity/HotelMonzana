//
//  AddRegistrationTableViewController.swift
//  HotelMonzana
//
//  Created by Dylan Williamson on 1/3/19.
//  Copyright © 2019 Dylan Williamson. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    // Store index path for pickers for easy comparison
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    // Store whether or not the date pickers will be shown, then show or hide them when the properties are set
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    

    // Section 0 outlets
    @IBOutlet weak var firstNameTextField: UITextField! // row 1, section header row is 0
    @IBOutlet weak var lastNameTextField: UITextField! // row 2
    @IBOutlet weak var emailTextField: UITextField! // row 3
    
    // Section 1 outlets
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    // Section 2 outlets
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    // Section 3 outlet
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateViews()
        updateNumberOfGuests()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        // Set Check-In min date to today
        checkInDatePicker.minimumDate = midnightToday
        // Set Check-In date to start with today
        checkInDatePicker.date = midnightToday
        

    }
    // MARK: - Update view methods
    func updateDateViews() {
        // Set Check-Out date Picker min date to 1 day after check-in date picker
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    // MARK: - Action methods
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
   
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let emailAddress = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let wifiSwitchState = wifiSwitch.isOn
    
        print("DONE BUTTON TAPPED")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Email Address: \(emailAddress)")
        print("Check-In date: \(checkInDate)")
        print("Check-Out date: \(checkOutDate)")
        print("Number of Adults: \(numberOfAdults)")
        print("Number of Children: \(numberOfChildren)")
        print("Wi-Fi switch state: \(wifiSwitchState)")
    }
    
    @IBAction func wifiSwitchChanged(_ sender: UISwitch) {
        // Implement later
    }
    
    
    // MARK: - Table View delegate methods
    
    // Dynamically modify the row's height at runtime
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row):
            if isCheckInDatePickerShown {
                return 140.0
            } else {
                return 0
            }
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
            if isCheckOutDatePickerShown {
                return 140.0
            } else {
                return 0
            }
        default:
            return 44.0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect cell user taps
        tableView.deselectRow(at: indexPath, animated: true)
       
        // Check if selected cell is date label, if so toggle appropriate date picker
        switch (indexPath.section, indexPath.row){
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row - 1):
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
            
            // Action tableView to requery attributes including cell height
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1):
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
            
            // Action tableView to requery attributes including cell height

            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
