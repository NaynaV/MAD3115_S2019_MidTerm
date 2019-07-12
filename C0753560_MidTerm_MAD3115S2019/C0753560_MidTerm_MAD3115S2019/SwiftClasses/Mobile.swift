//
//  Mobile.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation
class Mobile : Bill
{
    var mobileModelName : String
    var mobileNumber : String
    var internetGBused : Float
    var minuteUsed : Int
    var countryType : CountryType
    let internetRate : Float = 10
    let minuteRate : Float = 0.5
    var planName : String
    
    override init()
    {
        self.mobileModelName = ""
        self.mobileNumber = ""
        self.internetGBused = 0
        self.minuteUsed = 0
        self.countryType = CountryType.None
        self.planName = ""
        super.init()
    }
    init(billId : Int,billDate : Date,billType : BillType,mobileModelName : String,mobileNumber : String,internetGBused : Float,minuteUsed : Int,countryType : CountryType,planName : String)
    {
        self.mobileModelName = mobileModelName
        self.mobileNumber = mobileNumber
        self.internetGBused = internetGBused
        self.minuteUsed = minuteUsed
        self.countryType = countryType
        self.planName = planName
        super.init(billId: billId, billDate: billDate, billType: billType, totalBillAmount: 0)
    }
    
    override func calculateTotal()->Float
    {
        var total : Float = 0
        total = (internetGBused * self.internetRate) + ( Float(minuteUsed) * minuteRate )
        self.totalBillAmount = total
        return total
    }
    override func display()
    {
        print("Bill id : ",self.billId)
        print("Bill Date : ",self.billDate.getForamttedDate())
        print("Bill Type : ",self.billType)
        print("Bill Amount : ",self.totalBillAmount.currency())
        print("Manufacturer Name : ",self.mobileModelName)
        print("Plan Name : ",self.planName)
        print("Mobile Number : ",self.mobileNumber.countryCode(countryType: self.countryType))
        print("Internet Usage : ",self.internetGBused.formatGb())
        print("Minutes Usage : ",self.minuteUsed," minutes")
    }
}
