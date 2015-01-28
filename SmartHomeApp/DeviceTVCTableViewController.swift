//
//  DeviceTVCTableViewController.swift
//  SmartHomeApp
//
//  Created by MacMini-02 on 28/01/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit

class DeviceTVCTableViewController: UITableViewController {

    

    
        var daten = [String]()
        
    @IBAction func addNewData(sender: UIBarButtonItem) {
    
            var alert = UIAlertController(title: "Eingabe", message: "bitte geben Sie etwas ein", preferredStyle: .Alert)
            alert.addTextFieldWithConfigurationHandler(){
                textField in
                textField.textAlignment = .Right
                textField.placeholder = "neues Element"
            }
            
            alert.addAction(UIAlertAction(title: "Hinzufügen", style: .Default, handler: {
                action in
                
                
                self.daten.append((alert.textFields![0] as UITextField).text)
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Abbrechen", style: .Cancel, handler: nil))
            
            presentViewController(alert, animated: true, completion:{})
            
        }
        
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return daten.count
        }
        
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
            
            cell.textLabel.text = daten[indexPath.row]
            return cell
        }
    }

