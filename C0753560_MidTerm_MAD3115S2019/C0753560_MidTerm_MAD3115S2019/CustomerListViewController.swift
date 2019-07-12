//
//  CustomerListViewController.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    
 var customerList = [UsersStruct]()

    @IBOutlet weak var tbl_users: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        readCustomersPlistFile()
        self.tbl_users.delegate = self
        self.tbl_users.dataSource = self
        // Do any additional setup after loading the view.
    }
    func readCustomersPlistFile(){
        
        let plist = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        
        if let dict = NSMutableDictionary(contentsOfFile: plist!){
            if let customers = dict["Users"] as? [[String:Any]]
            {
                for customer in customers {
                    let id = customer["userID"] as! Int
                    let firstName = customer["userName"] as! String
                    
                    let email = customer["email"] as! String
                    let password = customer["password"] as! String
                    
                    self.customerList.append(UsersStruct(userID: id, userName: firstName, email: email, password: password))
                }
            }
        }
   

}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell")
        
        cell?.textLabel?.text = self.customerList[indexPath.row].userName
        
        return cell!
    }
}
