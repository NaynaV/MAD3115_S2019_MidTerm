//
//  studentData.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

class studentData
{
    
    static public var usersDict : [String : String] = [:]
    static public var usersArray : [User] = []
    
    static func readUserDataFromPlist()
    {
        if let pList = Bundle.main.path(forResource: "UserInfo", ofType: "plist")
        {
            if let dict = NSDictionary(contentsOfFile: pList)
            {
                // Reading User Array
                if let users = dict["UserList"] as? [[String:Any]]
                {
                    
                    //print(users)
                    for user in users
                    {
                        let myuser = User()
                        myuser.email = user["email"] as! String
                        myuser.password = user["password"] as! String
                        usersArray.append(myuser)
                        usersDict.updateValue(myuser.password, forKey: myuser.email)
                    }
                    
                }
            }
            
        }
        
    
    
    static func displayArrayDict()
    {
        for user in usersArray
        {
            print(user.userId)
            print(user.email)
            print(user.password)
        }
    }
}
