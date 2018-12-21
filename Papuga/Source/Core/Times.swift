//
//  Times.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 08/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

public enum Times: CustomStringConvertible {

    typealias ComparisonClosure = ( _ value: Int ) -> Bool

    case atLeastOnce
    case equal(to: Int)
    case greater(than: Int)
    case greaterThanOrEqual(to: Int)
    case less(than: Int)
    case lessThanOrEqual(to: Int)
    case never

    public var description: String {
        switch self {
        case .atLeastOnce:
            return "at least once"
        case .equal(let value):
            return "equal to \(value)"
        case .greater(let value):
            return "greater than \(value)"
        case .greaterThanOrEqual(let value):
            return "greater than or equal to \(value)"
        case .less(let value):
            return "less than \(value)"
        case .lessThanOrEqual(let value):
            return "less than or equal to \(value)"
        case .never:
            return "never"
        }
    }

    var comparison: ComparisonClosure {
        switch self {
        case .atLeastOnce:
            return { $0 >= 1 }
        case .equal(let value):
            return { $0 == value }
        case .greater(let value):
            return { $0 > value }
        case .greaterThanOrEqual(let value):
            return { $0 >= value }
        case .less(let value):
            return { $0 < value }
        case .lessThanOrEqual(let value):
            return { $0 <= value }
        case .never:
            return { $0 == 0 }
        }
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension Times: ExpressibleByIntegerLiteral {

    public typealias IntegerLiteralType = Int

    public init(integerLiteral value: Int) {
        self = .equal(to: value)
    }
}
