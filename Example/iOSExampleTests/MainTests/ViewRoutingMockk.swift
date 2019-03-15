//
//  ViewRoutingMockk.swift
//  iOSExampleTests
//
//  Created by Kamil Wyszomierski on 07/03/2019.
//  Copyright © 2019 HL Tech. All rights reserved.
//

import Papuga
@testable import iOSExample

class ViewRoutingMockk: Mock, Mockable, ViewRouting {

    enum PropertySignature: String {
        case window
    }

    struct PropertyMethod: Nameable, ParameterProviding, PropertyMethodTypeProviding {

        typealias Name = PropertySignature

        let name: PropertySignature
        let methodType: PropertyMethodType
        let parameter: Parameter<Any>

        static func window(getter: Parameter<UIWindow>) -> PropertyMethod {
            return PropertyMethod(name: .window, methodType: .get, parameter: getter.converted())
        }
    }

    struct Property<T>: Nameable {

        typealias Name = PropertySignature

        let name: PropertySignature

        static var window: Property<UIWindow> {
            return Property<UIWindow>(name: .window)
        }
    }

    enum MethodSignature: String {
        case showHomeScene = "showHomeScene()"
        case showLoginSceneCompletionClosureOf = "showLoginScene(completion: @escaping () -> Void)"
        case showLogoutSceneCompletionClosureOf = "showLogoutScene(completion: @escaping EmptyClosure)"
        case showUnauthorizedUserSceneSuccessClosureOfFailureClosureOf_T_ValueT_ReturnsGenericVoidOfError = "showUnauthorizedUserScene(success: @escaping EmptyClosure, failure: @escaping ValueClosure<Error>)"
    }

    struct Method: Nameable, ParametersProviding {

        typealias Name = MethodSignature

        let name: MethodSignature
        let parameters: [Parameter<Any>]

        static func showHomeScene() -> Method {
            return Method(name: .showHomeScene, parameters: [])
        }

        static func showLoginScene(completion: Parameter<() -> Void>) -> Method {
            return Method(name: .showLoginSceneCompletionClosureOf, parameters: [completion.converted()])
        }

        static func showLogoutScene(completion: Parameter<EmptyClosure>) -> Method {
            return Method(name: .showLogoutSceneCompletionClosureOf, parameters: [completion.converted()])
        }

        static func showUnauthorizedUserScene(success: Parameter<EmptyClosure>, failure: Parameter<ValueClosure<Error>>) -> Method {
            return Method(name: .showUnauthorizedUserSceneSuccessClosureOfFailureClosureOf_T_ValueT_ReturnsGenericVoidOfError, parameters: [success.converted(), failure.converted()])
        }
    }

    struct ReturnMethod<T>: Nameable {

        typealias Name = MethodSignature

        let name: MethodSignature
    }

    struct RethrowableMethod<T>: Nameable {

        typealias Name = MethodSignature

        let name: MethodSignature
    }

    struct ThrowableMethod<T>: Nameable {

        typealias Name = MethodSignature

        let name: MethodSignature
    }

    struct ClosureParameter<T> {

        static func completion() -> ClosureParameter<EmptyClosure> {
            return ClosureParameter<EmptyClosure>()
        }

        static func success() -> ClosureParameter<EmptyClosure> {
            return ClosureParameter<EmptyClosure>()
        }

        static func failure(_ value: Parameter<Error>) -> ClosureParameter<ValueClosure<Error>> {
            return ClosureParameter<ValueClosure<Error>>()
        }
    }

    struct ClosureMethod<T>: Nameable {

        typealias Name = MethodSignature

        let name: MethodSignature

        static func showLoginScene(_ completion: ClosureParameter<() -> Void>) -> ClosureMethod<() -> Void> {
            return ClosureMethod<() -> Void>(name: .showLogoutSceneCompletionClosureOf)
        }

        static func showLogoutScene(_ completion: ClosureParameter<EmptyClosure>) -> ClosureMethod<EmptyClosure> {
            return ClosureMethod<EmptyClosure>(name: .showLogoutSceneCompletionClosureOf)
        }

        static func showUnauthorizedUserScene(_ success: ClosureParameter<EmptyClosure>, _ failure: ClosureParameter<ValueClosure<Error>>) -> ClosureMethod<EmptyClosure> {
            return Method(name: .showUnauthorizedUserSceneSuccessClosureOfFailureClosureOf_T_ValueT_ReturnsGenericVoidOfError, parameters: [success.converted(), failure.converted()])
        }
    }

    var methodReturnValues: [MethodSignature: Any] = [:]
    var registeredMethodCalls: [MethodSignature: [Method]] = [:]
    var propertyReturnValues: [PropertySignature: Any] = [:]
    var registeredGetPropertyCalls: [PropertySignature: [PropertyMethod]] = [:]
    var registeredSetPropertyCalls: [PropertySignature: [PropertyMethod]] = [:]

    var window: UIWindow {
        get {
            let signature = PropertySignature.window
            let value: UIWindow = getPropertyReturnValue(for: signature)
            let property = PropertyMethod(name: signature, methodType: .get, parameter: .value(value))
            registerCall(for: property)
            return value
        }
    }

    func given<ClosureValue>(closure: ClosureValue, forClosureIn method: ClosureMethod<ClosureValue>) {

    }

    func given<ReturnValue>(value: ReturnValue, for property: Property<ReturnValue>) {
        propertyReturnValues[property.name] = value
    }

    func given<ReturnValue>(returns value: ReturnValue, for method: ReturnMethod<ReturnValue>) {
        methodReturnValues[method.name] = value
    }

    func given<ReturnValue>(returns value: ThrowableStub<ReturnValue>, for method: ThrowableMethod<ReturnValue>) {
        methodReturnValues[method.name] = value
    }

    func given<ReturnValue>(returns value: RethrowableStub<ReturnValue>, for method: RethrowableMethod<ReturnValue>) {
        methodReturnValues[method.name] = value
    }

    func showHomeScene() {
        let method = Method.showHomeScene()
        registerCall(for: method)
    }

    func showLoginScene(completion: @escaping () -> Void) {
        let method = Method.showLoginScene(completion: Parameter<() -> Void>.value(completion))
        registerCall(for: method)
    }

    func showLogoutScene(completion: @escaping EmptyClosure) {
        let method = Method.showLogoutScene(completion: Parameter<EmptyClosure>.value(completion))
        registerCall(for: method)
    }
}
