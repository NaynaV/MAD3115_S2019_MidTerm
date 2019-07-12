//
//  studentData.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation


struct UsersStruct {
    let userID : Int
    var userName : String
    //var customerLName : String
    var email : String
    var password : String
    
  /*  var fullName : String{
        return "\(customerFName ) \(customerLName)"
    }*/
    
}


/*
class studentData
{
    
    static public var usersDict : [String : String] = [:]
    static public var usersArray : [User] = []
     static var loggedInUser:String?
    
    static func readUserDataFromPlist()
    {
        if let pList = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: pList)
            {
                // Reading User Array
                if let customers = dict["UserList"] as? [[String:Any]]
                {
                    
                    //print(users)
                    for customer in customers
                    {
                        let myCustomer = User()
                        
                        myCustomer.email = customer["email"] as! String
                        myCustomer.password = customer["password"] as! String
                        usersArray.append(myCustomer)
                        usersDict.updateValue(myCustomer.password, forKey: myCustomer.email)
                    }
                    
                }
            }
            
        }
        
    
    
     func displayArrayDict()
    {
        for user in usersArray
        {
            print(user.userId)
            print(user.email)
            print(user.password)
        }
    }
}
}
*/
