//
//  AddRegistrationTableViewController.swift
//  HotelMonzana
//
//  Created by Dylan Williamson on 1/3/19.
//  Copyright © 2019 Dylan Williamson. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    

    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateViews()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        // Set Check-In min date to today
        checkInDatePicker.minimumDate = midnightToday
        // Set Check-In date to start with today
        checkInDatePicker.date = midnightToday
        

    }
    
    func updateDateViews() {
        // Set Check-Out date Picker min date to 1 day after check-in date picker
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let emailAddress = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
    
        print("DONE BUTTON TAPPED")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Email Address: \(emailAddress)")
        print("Check-In date: \(checkInDate)")
        print("Check-Out date: \(checkOutDate)")
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
