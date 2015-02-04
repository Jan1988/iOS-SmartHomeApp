//
//  RoomListTVC.swift
//  SmartHomeApp
//
//  Created by MacMini-02 on 04/02/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit


class RoomListTVC: UIViewController {

    var commandString: String = "{\"sessionid\":\"gq7drvl41vtr18ddkne1k3a40j\",\"permission\":\"3\",\"method\":\"Rooms.GetAllRooms\",\"params\"{\"null\":\"null\"}}"
    
    var httpsClass = HTTPS_Sender()
    
    @IBOutlet weak var replyTV: UITextView!
    
    
    
    @IBAction func sendRequest(sender: UIButton) {
        
        
        
        
    }
    
    
}
