// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

//
// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable identifier_name
// swiftlint:disable nesting

import UIKit
import Papuga
@testable import iOSExample

// MARK: - ViewRoutingMock

class ViewRoutingMock: Mock, Mockable, ViewRouting {

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

    func showUnauthorizedUserScene(success: @escaping EmptyClosure, failure: @escaping ValueClosure<Error>) {
        let method = Method.showUnauthorizedUserScene(success: Parameter<EmptyClosure>.value(success), failure: Parameter<ValueClosure<Error>>.value(failure))
        registerCall(for: method)
    }
}
