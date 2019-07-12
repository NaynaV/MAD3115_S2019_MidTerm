//
//  extension_float.swift
//  C0753560_MidTerm_MAD3115S2019
//
//  Created by Nayna on 7/11/19.
//  Copyright © 2019 Nayna. All rights reserved.
//

import Foundation
extension Float
{
    public func currency() -> String
    {
        return String(format: "$%0.2f", self)
    }
    public func formatUnits() -> String
    {
        return String(format : "%0.0f units", self)
    }
    public func formatGb() -> String
    {
        return String(format : "%0.0f GB", self)
}
