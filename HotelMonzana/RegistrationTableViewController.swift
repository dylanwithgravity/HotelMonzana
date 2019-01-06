//
//  RegistrationTableViewController.swift
//  HotelMonzana
//
//  Created by Dylan Williamson on 1/6/19.
//  Copyright © 2019 Dylan Williamson. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    // Array property holding registration objects
    var registrations: [Registration] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return registrations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Step 1 create reusable tableView cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        
        // Step 2 fetch model object to be displayed
        let registration = registrations[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short

        //  Step 3 configure the cell
        cell.textLabel?.text = "\(registration.firstName) \(registration.lastName)"
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + "-" + dateFormatter.string(from: registration.checkOutDate) + ":" + "\(registration.roomType.name)"
        
        // Return cell
        return cell
    }
    

    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        
        guard unwindSegue.identifier == "DoneUnwind" else { return }
        
        let sourceViewController = unwindSegue.source as? AddRegistrationTableViewController
        
        if let registration = sourceViewController?.registration {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                registrations[selectedIndexPath.row] = registration
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: registrations.count, section: 0)
                registrations.append(registration)
                tableView.insertRows(at: [newIndexPath], with: .none)
            }
        }
//        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController, let registration = addRegistrationTableViewController.registration else { return }
//
//        tableView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditRegistration" {
            let indexPath = tableView.indexPathForSelectedRow!
            let registration = registrations[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addRegistrationTableViewController = navController.topViewController as! AddRegistrationTableViewController
            addRegistrationTableViewController.selectedRegistration = registration
            
        }
        // Get the new view controller using segue.destination.
        
        // Pass the selected object to the new view controller.
    }
    

}
