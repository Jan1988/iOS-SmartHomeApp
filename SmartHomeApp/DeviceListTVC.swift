//
//  DeviceListTVC.swift
//  SmartHomeApp
//
//  Created by Caroline Hechler on 01.02.15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit

class DeviceListTVC: UITableViewController {
    
    
    
    
    var daten = [Device]()
    
    @IBAction func addDevice(sender: UIBarButtonItem) {
        
        performSegueWithIdentifier("addDevice", sender: self)
        
    }
    
    override func  viewDidLoad() {
        let testDevice1 = Device(name: "Heating Sensor", serialNumber: "001", room: "Kitchen")
        daten += [testDevice1]
        println(daten[0].name)
    }
    

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return daten.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cells") as UITableViewCell
        
        cell.textLabel.text = "\(daten[indexPath.row].room): \(daten[indexPath.row].name)"
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goto_DeviceDetails"{
            let row = tableView.indexPathForCell(sender as UITableViewCell)?.row
            (segue.destinationViewController as DeviceDetailsVC).daten = daten[row!]

        }else if segue.identifier == "addDevice"{
            //segue wird ausgeführt

        }
    }
    



    
}



