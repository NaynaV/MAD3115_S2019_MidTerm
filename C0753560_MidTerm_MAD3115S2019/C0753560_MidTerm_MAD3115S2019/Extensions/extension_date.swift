//
//  extension_date.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation
extension Date
{
    public func getForamttedDate() -> String
    {
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-mm-yyyy"
        // in the format "Thursday, 20 june, 2019
        var formattedDate = dateFormatter.string(from: self)
        return formattedDate
}
}
