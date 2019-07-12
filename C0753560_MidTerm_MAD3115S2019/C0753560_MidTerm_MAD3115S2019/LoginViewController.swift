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
    
    var UsersDict = [UsersStruct]()
    
    // getting user defaults reference
    let userDefault = UserDefaults.standard
    
    
    override func viewDidLoad()
    {
        switch_rememberMe.isOn = false
        getRememberMe()
        readCustomersPlistFile()
       /* studentData.readUserDataFromPlist()
        
        if let email = UserDefaults.standard.string(forKey: "email")
        {
            if email != ""
            {
                txt_emailID.text = email
                txt_password.text = UserDefaults.standard.string(forKey: "password")
            }
        }
        */
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    @IBAction func btn_login(_ sender: Any)
    {
        
        if let email = txt_emailID.text{
            if !email.isEmpty{
                
                if email.isVAlidEmail(){
                    if let password = txt_password.text{
                        if !password.isEmpty{
                            if password.sizeCheck(){
                                
                                if  checkEmailPassword(email: email, password: password) {
                                      setRememberMe()
                                    
                                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                    let dashboardVC = storyboard.instantiateViewController(withIdentifier: "customerListVC") as! CustomerListViewController
                                    
                                    self.navigationController?.pushViewController(dashboardVC, animated: true)
                                    
                                    
                                }else{
                                    showAlerBox(msg: "You have enter wrong credentials")
                                }
                                
                            }else{
                                showAlerBox(msg: "Invalid password size")
                            }
                            
                        }else{
                            showAlerBox(msg: "Please enter password")
                        }
                    }
                }
                else{
                    showAlerBox(msg: "Please enter valid email")
                }
            }else{
                showAlerBox(msg: "Please enter useremail")
            }
        }
    }
        func showAlerBox(msg : String)  {
            let alertController = UIAlertController(title: "CustomerBillApp", message:
                msg, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
        func readCustomersPlistFile(){
            
            let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
            
            if let dict = NSMutableDictionary(contentsOfFile: plist!){
                if let Customers = dict["Users"] as? [[String:Any]]
                {
                    for customer in Customers {
                        let id = customer["userID"] as! Int
                        let firstName = customer["userName"] as! String
                    
                        let email = customer["email"] as! String
                        let password = customer["password"] as! String
                        
                        self.UsersDict.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                    }
                }
            }
            
        }
        
        
        
        func checkEmailPassword(email : String , password : String) -> Bool{
            
            for everyCustomer in UsersDict{
                if (everyCustomer.email == email && everyCustomer.password == password) {
                    return true
                }
            }
            return false
        }
        
        func setRememberMe()  {
            if switch_rememberMe.isOn {
                userDefault.set(self.txt_emailID.text, forKey: "email")
                userDefault.set(self.txt_password.text, forKey: "password")
            }else{
                userDefault.set("", forKey: "email")
                userDefault.set("", forKey: "password")
            }
        }
        
         func getRememberMe()
        {
            let userDefault = UserDefaults.standard
            
            if let email = userDefault.string(forKey: "email")
            {
                txt_emailID.text = email
                
                if let password = userDefault.string(forKey: "password")
                {
                    txt_password.text = password
                    switch_rememberMe.setOn(true, animated: false)
                }
            }
        }
        /*
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
                
                
                if let userpassword = studentData.usersDict[txt_emailID.text!]
                {
                    if userpassword == txt_password.text!
                    {
                        studentData.loggedInUser = txt_emailID.text!
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let dashboardVC = storyboard.instantiateViewController(withIdentifier: "customerListVC") as! CustomerListViewController
                        let navcon = UINavigationController(rootViewController: dashboardVC)
                        
                        present(navcon, animated: true, completion: nil)
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
    }*/
    
        }
    
   



