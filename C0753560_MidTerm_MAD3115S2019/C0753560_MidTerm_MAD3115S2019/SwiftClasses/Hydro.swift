//
//  Hydro.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation
class Hydro : Bill
{
    var agencyName : String
    var unitConsumed : Float
    let unitRate : Float = 10
    
    override init()
    {
        self.agencyName = ""
        self.unitConsumed = 0
        super.init()
    }
    init(billId: Int, billDate: Date, billType: BillType,agencyName : String,unitConsumed : Float )
    {
        self.agencyName = agencyName
        self.unitConsumed = unitConsumed
        super.init(billId: billId, billDate: billDate, billType: billType,totalBillAmount: 0)
    }
    
    override func calculateTotal()->Float
    {
        var total : Float = 0
        total = self.unitConsumed * self.unitRate
        self.totalBillAmount = total
        return total
    }
    
    override func display()
    {
        print("Bill id : ",self.billId)
        print("Bill Date : ",self.billDate.getForamttedDate())
        print("Bill Type : ",self.billType)
        print("Bill Amount : ",self.totalBillAmount.currency())
        print("Agency Name : ",self.agencyName)
        print("Unit Consumed : ",self.unitConsumed.formatUnits())
}
}
