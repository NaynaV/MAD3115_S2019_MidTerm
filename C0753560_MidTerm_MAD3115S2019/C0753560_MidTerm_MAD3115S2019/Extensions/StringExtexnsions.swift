//
//  StringExtexnsions.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

extension String
{
    /*
    var isValidEmail:Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    */
    
    
    
 
        func  isVAlidEmail() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self)
        }
    func isValidMobile() -> Bool
    {
        let mobileRegEx = "^[1{1}]\\s\\d{3}-\\d{3}-\\d{4}$"
        let mobileTest = NSPredicate(format:"SELF MATCHES %@", mobileRegEx)
        return mobileTest.evaluate(with: self)
    }
    
    
        func sizeCheck() -> Bool{
            if self.count < 6 {
                print("Size of password must be equal or greater than 6")
                return false
            }
            return true
        }
    
    func countryCode(countryType:CountryType) -> String
    {
        if(countryType == CountryType.Canada)
        {
            return "+1\(self)"
        }
        else
        {
            return "+91\(self)"
        }
    }
}

