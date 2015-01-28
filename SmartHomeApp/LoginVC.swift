//
//  LoginVC.swift
//  SmartHomeApp
//
//  Created by MacMini-02 on 14/01/15.
//  Copyright (c) 2015 Uni Mannheim. All rights reserved.
//

import UIKit

struct loginData {
    var username: String = "jan"
    var password: String = "123"
}


class LoginVC: UIViewController {


    var up = loginData()
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var checkUserLabel: UILabel!
    @IBOutlet weak var checkPwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func loginButton(sender: UIButton) {
        

        var boolUser: Bool = false
        var boolPw: Bool = false
        
        checkUserLabel.text = ""
        checkPwLabel.text = ""
        
        //Username check
        if up.username == textFieldUsername.text {
            boolUser = true
            
        }else if textFieldUsername.text == "" {
            checkUserLabel.text = "Username is empty"
            
        }else {
            checkUserLabel.text = "Username is incorrect"
            
        }
        
        //Password check
        if up.password == textFieldPassword.text {
            boolPw = true
            
        }else if textFieldPassword.text == "" {
            checkPwLabel.text = "Password is empty"
            
        }else {
            checkPwLabel.text = "Password is incorrect"
            
        }
        
        //Password && Username
        if boolUser && boolPw {
            performSegueWithIdentifier("goto_Menu", sender: self)
        }
            
        
   

        

    }


}
