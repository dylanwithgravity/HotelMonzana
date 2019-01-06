//
//  SelectRoomTypeTableViewController.swift
//  HotelMonzana
//
//  Created by Dylan Williamson on 1/4/19.
//  Copyright © 2019 Dylan Williamson. All rights reserved.
//

import UIKit


// Custom protocol to pass the guest's selected roomType back to the registation tableView controller
protocol SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType)
}

class SelectRoomTypeTableViewController: UITableViewController {
    
    // Property to hold reference that will be implementing the SelectRoomTypeTableViewControllerDelegate Protocol
    var delegate: SelectRoomTypeTableViewControllerDelegate?
    var roomType: RoomType?

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
        let numberOfRows = RoomType.all.count
        return numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Step 1 configure cell to dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        
        // Step 2 fetch model object to be displayed
        let roomType = RoomType.all[indexPath.row]
        
        // Configure cell properties with model object properties
        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
        
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        // Step 4 return cell
        return cell
    }
    
    // MARK: - Table view delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Set roomType property to the room type that corresponds to the index path
        roomType = RoomType.all[indexPath.row]
        
        
        delegate?.didSelect(roomType: roomType!)
        // Reload table view
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
