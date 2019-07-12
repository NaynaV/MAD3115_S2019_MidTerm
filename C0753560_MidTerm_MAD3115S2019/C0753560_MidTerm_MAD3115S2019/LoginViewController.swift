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
           if let email = UserDefaults.standard.string(forKey: "email")
        {
            if email != ""
            {
                txt_emailID.text = email
                txt_password.text = UserDefaults.standard.string(forKey: "password")
            }
        }
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func btn_login(_ sender: Any)
    {
        if  txt_emailID.text! == ""
        {
            let alertController = UIAlertController(title: "Fill Out The Information", message: "Please Enter an Email to continue.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        else
        {
            if txt_password.text! == ""
            {
                let alertController = UIAlertController(title: "Fill Out The Information", message: "Please Enter an Password to continue.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                self.present(alertController, animated: true)
            }
            else if !txt_emailID.text!.isValidEmail
            {
                let alertController = UIAlertController(title: "Invalid Email", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                self.present(alertController, animated: true)
            }
            else
            {
                if switch_rememberMe.isOn
                {
                    UserDefaults.standard.set(txt_emailID.text!, forKey: "email")
                    UserDefaults.standard.set(txt_password.text!, forKey: "password")
                    
                }
                
                
                if let userpassword = readCustomersFromPlistFile.users[txt_emailID.text!]
                {
                    if userpassword == txt_password.text!
                    {
                        DataStore.loggedInUser = txt_emailID.text!
                       // let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     //   let dashboardVC = storyboard.instantiateViewController(withIdentifier: "dashboardVC") as! DashboardViewController
                      //  let navcon = UINavigationController(rootViewController: dashboardVC)
                        
                        //present(navcon, animated: true, completion: nil)
                    }
                    else
                    {
                        let alertController = UIAlertController(title: "Authentication Failed", message: "Password does not match with our records.", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(action)
                        self.present(alertController, animated: true)
                    }
                }
                else
                {
                    let alertController = UIAlertController(title: "User Does not exist", message: "User with email \"\(txt_emailID.text!)\" does not exist.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                }
            }
            
        }
    }
        }
    
    private func getRememberMeValues()
    {
        let userDefault = UserDefaults.standard
        
        if let email = userDefault.string(forKey: "userEmailID")
        {
            txt_emailID.text = email
            
            if let pwd = userDefault.string(forKey: "userPassword")
            {
                txt_password.text = pwd
                switch_rememberMe.setOn(true, animated: false)
            }
        }
    }


