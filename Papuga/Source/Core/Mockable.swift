//
//  Mockable.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 12/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

// swiftlint:disable force_cast

import Foundation

public protocol Mockable: class {

    associatedtype Method: Nameable & ParametersProviding where Method.Name == MethodSignature
    associatedtype MethodSignature: Hashable & RawRepresentable where MethodSignature.RawValue == String
    associatedtype PropertyMethod: Nameable & ParameterProviding & PropertyMethodTypeProviding where PropertyMethod.Name == PropertySignature
    associatedtype PropertySignature: Hashable & RawRepresentable where PropertySignature.RawValue == String

    var methodReturnValues: [MethodSignature: Any] { get set }
    var registeredMethodCalls: [MethodSignature: [Method]] { get set }
    var propertyReturnValues: [PropertySignature: Any] { get set }
    var registeredGetPropertyCalls: [PropertySignature: [PropertyMethod]] { get set }
    var registeredSetPropertyCalls: [PropertySignature: [PropertyMethod]] { get set }
}

extension Mockable where Self: Mock {

    public func verify(method: Method, whichNumberOfCallsIs times: Times, file: StaticString = #file, line: UInt = #line) {
        let numberOfCalls = getNumberOfCalls(for: method)
        verify(ifNumberOfCalls: numberOfCalls, is: times, rawSignature: method.name.rawValue, file: file, line: line)
    }

    public func verify(property: PropertyMethod, whichNumberOfCallsIs times: Times, file: StaticString = #file, line: UInt = #line) {
        let numberOfCalls = getNumberOfCalls(for: property)
        verify(ifNumberOfCalls: numberOfCalls, is: times, rawSignature: property.name.rawValue, file: file, line: line)
    }

    private func getNumberOfCalls(for method: Method) -> Int {
        var numberOfCalls: Int = 0
        let calls = registeredMethodCalls[method.name] ?? []
        for aCall in calls {
            let hasEqualNumbersOfParameters = method.parameters.count == aCall.parameters.count
            guard hasEqualNumbersOfParameters else {
                continue
            }

            var hasMatchableParameters = true
            for index in method.parameters.indices {
                let parameter = method.parameters[index]
                let calledParameter = aCall.parameters[index]
                let areParametersMatching = parameter ~== calledParameter
                if !areParametersMatching {
                    hasMatchableParameters = false
                    break
                }
            }

            if hasMatchableParameters {
                numberOfCalls += 1
            }
        }

        return numberOfCalls
    }

    private func getNumberOfCalls(for property: PropertyMethod) -> Int {
        var numberOfCalls: Int = 0
        var registeredCalls: [PropertySignature: [PropertyMethod]]

        switch property.methodType {
        case .get:
            registeredCalls = registeredGetPropertyCalls
        case .set:
            registeredCalls = registeredSetPropertyCalls
        }

        let calls = registeredCalls[property.name] ?? []
        for aCall in calls where aCall.parameter ~== property.parameter {
            numberOfCalls += 1
        }

        return numberOfCalls
    }

    public func getMethodReturnValue<ReturnValue>(for method: Method) -> ReturnValue {
        guard methodReturnValues[method.name] is ReturnValue else {
            let error = MockError.cannotGetStubbedReturnValue(methodSignature: method.name.rawValue)
            failure(error.description, file: file, line: line)
        }

        return methodReturnValues[method.name] as! ReturnValue
    }

    public func getPropertyReturnValue<ReturnValue>(for propertySignature: PropertySignature) -> ReturnValue {
        guard propertyReturnValues[propertySignature] is ReturnValue else {
            let error = MockError.cannotGetStubbedReturnValue(methodSignature: propertySignature.rawValue)
            failure(error.description, file: file, line: line)
        }

        return propertyReturnValues[propertySignature] as! ReturnValue
    }

    public func getThrowableReturnValue<ReturnValue>(for method: Method) throws -> ReturnValue {
        guard methodReturnValues[method.name] is ThrowableStub<ReturnValue> else {
            let error = MockError.cannotGetStubbedReturnValue(methodSignature: method.name.rawValue)
            failure(error.description, file: file, line: line)
        }

        let stub = methodReturnValues[method.name] as! ThrowableStub<ReturnValue>
        switch stub {
        case .error(let error):
            throw error
        case .value(let value):
            return value
        }
    }

    public func registerCall(for method: Method) {
        if registeredMethodCalls[method.name] == nil {
            registeredMethodCalls[method.name] = []
        }
        registeredMethodCalls[method.name]?.append(method)
    }

    public func registerCall(for property: PropertyMethod) {
        switch property.methodType {
        case .get:
            if registeredGetPropertyCalls[property.name] == nil {
                registeredGetPropertyCalls[property.name] = []
            }
            registeredGetPropertyCalls[property.name]?.append(property)
        case .set:
            if registeredSetPropertyCalls[property.name] == nil {
                registeredSetPropertyCalls[property.name] = []
            }
            registeredSetPropertyCalls[property.name]?.append(property)
        }
    }
    
    public func throwMockedError(for method: Method) throws {
        guard methodReturnValues[method.name] is ThrowableStub<()> else {
            let error = MockError.cannotGetStubbedReturnValue(methodSignature: method.name.rawValue)
            failure(error.description, file: file, line: line)
        }
        
        let stub = methodReturnValues[method.name] as! ThrowableStub<()>
        switch stub {
        case .error(let error):
            throw error
        case .value:
            return
        }
    }

    private func verify(ifNumberOfCalls numberOfCalls: Int, `is` times: Times, rawSignature: String, file: StaticString, line: UInt) {
        let isMatchingTimes = times.comparison(numberOfCalls)
        guard !isMatchingTimes else {
            return
        }

        var error: MockError
        switch times {
        case .atLeastOnce, .equal, .greater, .greaterThanOrEqual, .less, .lessThanOrEqual:
            error = .unexpectedNumberOfCalls(methodSignature: rawSignature, numberOfCalls: numberOfCalls, times: times)
        case .never:
            error = .unexpectedMethodCall(methodSignature: rawSignature)
        }

        failTest(error.description, file: file, line: line)
    }
}
