//
//  extensionInt.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/12/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation

extension Int
{
    public func unit() -> String
    {
        return String.init(format: "%d Units", self)
    }
    public func data() -> String
    {
        return String.init(format: "%d GB", self)
    }
    public func minutes() -> String
    {
        return String.init(format: "%d Minute(s)", self)
    }
}
