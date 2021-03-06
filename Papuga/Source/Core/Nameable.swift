//
//  Nameable.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 12/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

public protocol Nameable {

    associatedtype Name

    var name: Name { get }
}
