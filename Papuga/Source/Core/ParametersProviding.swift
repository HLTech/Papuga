//
//  ParametersProviding.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 13/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

public protocol ParametersProviding {

    var parameters: [Parameter<Any>] { get }
}
