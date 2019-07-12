//
//  Internet.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

class Internet : Bill
{
    var providerName : String
    var internetGBused : Float
    let internetRate : Float = 10
    
    override init()
    {
        self.providerName = ""
        self.internetGBused = 0
        super.init()
    }
    
    init(billId: Int, billDate: Date, billType: BillType,providerName : String,internetGBused : Float)
    {
        self.providerName = providerName
        self.internetGBused = internetGBused
        super.init(billId: billId, billDate: billDate, billType: billType, totalBillAmount: 0)
    }
    
    override func calculateTotal()->Float
    {
        var total : Float = 0
        total = self.internetGBused * self.internetRate
        self.totalBillAmount = total
        return total
    }
    
    override func display()
    {
        print("Bill id : ",self.billId)
        print("Bill Date : ",self.billDate.getForamttedDate())
        print("Bill Type : ",self.billType)
        print("Bill Amount : ",self.totalBillAmount.currency())
        print("Provider Name : ",self.providerName)
        print("Internet Usage : ",self.internetGBused.formatGb())
}
}
