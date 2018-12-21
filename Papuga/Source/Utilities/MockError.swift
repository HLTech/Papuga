//
//  MockError.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 07/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

enum MockError: Error {

    case cannotConvertParamterWith(typeName: String, toTypeName: String)
    case cannotGetStubbedReturnValue(methodSignature: String)
    case unexpectedMethodCall(methodSignature: String)
    case unexpectedNumberOfCalls(methodSignature: String, numberOfCalls: Int, times: Times)

    var description: String {
        switch self {
        case .cannotConvertParamterWith(let typeName, let convertionTypeName):
            return "Cannot convert `Parameter`'s generic type `\(typeName)` to specified type `\(convertionTypeName)`."
        case .cannotGetStubbedReturnValue(let methodSignature):
            return "Cannot get stubbed return value for `\(methodSignature)`.\nUse `given` method in your test case or setup to provide stubbed return value."
        case .unexpectedMethodCall(let methodSignature):
            return "Expected never calling `\(methodSignature)`."
        case .unexpectedNumberOfCalls(let methodSignature, let numberOfCalls, let times):
            return "Expected number of calls \(times) but has \(numberOfCalls) for `\(methodSignature)`."
        }
    }
}
