//
//  Bill.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

class Bill : IDisplay
{
    func display()
    {
        print("Bill id : ",self.billId)
        print("Bill Date : ",self.billDate.getForamttedDate())
        print("Bill Type : ",self.billType)
        print("Bill Amount : ",self.totalBillAmount.currency())
    }
    
    let billId : Int
    var billDate : Date
    var billType : BillType
    public var totalBillAmount : Float
    
    init()
    {
        self.billId = 0
        self.billDate = Date()
        self.billType = BillType.None
        self.totalBillAmount = 0
    }
    init(billId : Int,billDate : Date,billType : BillType,totalBillAmount : Float) {
        self.billId = billId
        self.billDate = billDate
        self.billType = billType
        self.totalBillAmount = totalBillAmount
    }
    
    func calculateTotal()->Float
    {
        var total : Float = 0
        self.totalBillAmount = total
        return total
}
    
