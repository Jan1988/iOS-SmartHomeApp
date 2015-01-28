//
//  MenuVC.swift
//  SmartHomeApp
//
//  Created by MacMini-02 on 22/01/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit




class MenuVC: UIViewController {

    
    var up = loginData()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Benutzer: \(up.username)"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
