//
//  MenuVC.swift
//  SmartHomeApp
//
//  Created by MacMini-02 on 22/01/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit




class MenuVC: UIViewController {

    @IBOutlet weak var myRoomsButton: UIButton!
    @IBOutlet weak var myScenariosButton: UIButton!
    @IBOutlet weak var myDevicesButton: UIButton!
    @IBOutlet weak var myUsersButton: UIButton!
    @IBOutlet weak var mySettingsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    
    var up = loginData()
    let imageView = UIImageView(frame: CGRectMake(0, 0, 768, 1200))
    let image = UIImage(named: "MenuBackground")
    

    
    
    
    override func viewDidLoad() {

        
        
        myScenariosButton.layer.cornerRadius = 10
        myScenariosButton.layer.borderWidth = 4
        myScenariosButton.layer.borderColor = UIColor.blackColor().CGColor
        
        myRoomsButton.layer.cornerRadius = 20
        myRoomsButton.layer.borderWidth = 3
        myRoomsButton.layer.borderColor = UIColor.blackColor().CGColor
        
        super.viewDidLoad()
        
        imageView.image = image
        imageView.alpha = 0.5
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        

       
        
        self.title = "Welcome \(up.username)"
        
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
