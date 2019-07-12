//
//  ViewController.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{

    @IBOutlet weak var txt_emailID: UITextField!
    
    @IBOutlet weak var txt_password: UITextField!
    
    @IBOutlet weak var switch_rememberMe: UISwitch!
    
     
    
    override func viewDidLoad()
    {
        studentData.readUserDataFromPlist()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func btn_login(_ sender: Any)
    {
        let myEmail = self.txt_emailID.text!
        let myPassword = self.txt_password.text!
        if let password = studentData.usersDict[myEmail]
        {
            // User Exists
            if(myPassword == password)
            {
                // User password correct
                let alertControl = UIAlertController(title: "Message", message: "Correct Information Entered", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertControl.addAction(actionOk)
                self .present(alertControl , animated: true , completion: nil)
                
            }
            else
            {
                //user password incorrect
                let alertControl = UIAlertController(title: "Message", message: "Incorrect Password Entered", preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertControl.addAction(actionOk)
                self .present(alertControl , animated: true , completion: nil)
                
            }
        }
        else
        {
            //User Doesnt Exist
            let alertControl = UIAlertController(title: "Message", message: "User Does Not Exist", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertControl.addAction(actionOk)
            self .present(alertControl , animated: true , completion: nil)        }
    }
        }
    
   



