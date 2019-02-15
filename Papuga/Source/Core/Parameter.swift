//
//  Parameter.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 12/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

public enum Parameter<Value>: Matchable {
    case any
    case match(Closure.ValueReturn<Value, Bool>)
    /// This case should be used only in genereted files. Use `equal(to:)` method for equality check.
    case value(Value)

    public static func ~== (lhs: Parameter<Value>, rhs: Parameter<Value>) -> Bool {
        switch (lhs, rhs) {
        case (_, .any),
             (.any, _):
            return true
        case (.value(let value), .match(let matchingRule)),
             (.match(let matchingRule), .value(let value)):
            return matchingRule(value)
        case (.match, .match),
             (.value, .value):
            return false
        }
    }

    public func converted(file: StaticString = #file, line: UInt = #line) -> Parameter<Any> {
        switch self {
        case .any:
            return .any
        case .match(let matchingRule):
            let convertedRule: Closure.ValueReturn<Any, Bool> = { (value) in
                switch value {
                case let convertedValue as Value:
                    return matchingRule(convertedValue)
                default:
                    let typeName = String(describing: type(of: value))
                    let convertionTypeName = String(describing: Value.self)
                    let error = MockError.cannotConvertParamterWith(typeName: typeName, toTypeName: convertionTypeName)
                    failure(error.description, file: file, line: line)
                }
            }

            return .match(convertedRule)
        case .value(let value):
            return .value(value as Any)
        }
    }
}

extension Parameter where Value: Equatable {

    public static func equal(to value: Value) -> Parameter<Value> {
        return .match { $0 == value }
    }
}

extension Parameter where Value == String {

    public static func anyString() -> Parameter<Value> {
        return .any
    }
}
