//
//  DeviceDetailsVC.swift
//  SmartHomeApp
//
//  Created by MacMini-02 on 02/02/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit

protocol DeviceDetailsVCDelegate{
    func didAddDevice (device:Device)
    func didChangeDevice(device:Device, atRow:Int)
    
}

class DeviceDetailsVC: UIViewController {
    
    
    var delegate: DeviceDetailsVCDelegate?
    var daten: Device?
    var string: String!
    var editingEnabled = false
    var row: Int?
    
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var devicenameTextField: UITextField!
    @IBOutlet weak var serialnumberTextField: UITextField!
    @IBOutlet weak var roomPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
 
        if let name = daten?.name {
            headerLabel.text = name
        }else{
            headerLabel.text = "New Device"
        }
        
        devicenameTextField.text = daten?.name
        serialnumberTextField.text = daten?.serialNumber
        
        
        if daten == nil{
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "cancel")
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save Device", style: .Done, target: self, action: "save")
            devicenameTextField.becomeFirstResponder()
        }else{
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .Plain, target: self, action: "editing")
            enableAllTextFields(false)
            
        }

    }
    
    func cancel(){
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func save(){
        
        var newDevice = Device(name: devicenameTextField.text, serialNumber: serialnumberTextField.text, room: "default")
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        delegate?.didAddDevice(newDevice)
        
    }

    func editing (){
        switch editingEnabled {
        case true:
            delegate?.didChangeDevice(Device(name: devicenameTextField.text, serialNumber: serialnumberTextField.text, room: "default"), atRow: row!)
            navigationItem.rightBarButtonItem?.title = "edit"
        default:
            navigationItem.rightBarButtonItem?.title = "done"
            
        }
        editingEnabled = !editingEnabled
        enableAllTextFields(editingEnabled)
        
    }
    
    func enableAllTextFields(enable: Bool){
        devicenameTextField.enabled = enable
        serialnumberTextField.enabled = enable
        
    }
    

}
