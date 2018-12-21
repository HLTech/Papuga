//
//  Matchable.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 15/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

infix operator ~==

public protocol Matchable {

    static func ~== (lhs: Self, rhs: Self) -> Bool
}
