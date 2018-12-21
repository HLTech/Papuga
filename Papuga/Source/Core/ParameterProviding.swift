//
//  ParameterProviding.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 30/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

public protocol ParameterProviding {

    var parameter: Parameter<Any> { get }
}
