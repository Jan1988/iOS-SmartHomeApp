//
//  DeviceListTVC.swift
//  SmartHomeApp
//
//  Created by Caroline Hechler on 01.02.15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit



class DeviceListTVC: UITableViewController, DeviceDetailsVCDelegate {
    
    
    

    var daten = [Device]()
    
    @IBAction func addDevice(sender: UIBarButtonItem) {
        
        performSegueWithIdentifier("addDevice", sender: self)
        
    }
    
    override func  viewDidLoad() {
        let testDevice1 = Device(name: "Heating Sensor", serialNumber: "001", room: "Kitchen")
        daten += [testDevice1]
        
    }
    

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return daten.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("Cells") as UITableViewCell
        
        cell.textLabel.text = "\(daten[indexPath.row].room): \(daten[indexPath.row].name)"
        
        var imageInCells = UIImage(named: "Heating Sensor")
        cell.imageView.image = imageInCells
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goto_DeviceDetails"{
            let row = tableView.indexPathForCell(sender as UITableViewCell)?.row
            (segue.destinationViewController as DeviceDetailsVC).daten = daten[row!]
            (segue.destinationViewController as DeviceDetailsVC).row = row
            (segue.destinationViewController as DeviceDetailsVC).delegate = self

        }else if segue.identifier == "addDevice"{
            ((segue.destinationViewController as UINavigationController).viewControllers[0] as DeviceDetailsVC).delegate = self
            

        }
    }
    
     func didAddDevice(device: Device) {
        
        daten += [device]
        tableView.reloadData()
        
    }

    func didChangeDevice(device: Device, atRow: Int) {
        
        daten[atRow] = device
        tableView.reloadData()
    }
    
}



