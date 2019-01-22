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
    }

    struct Method: Nameable, ParametersProviding {

        typealias Name = MethodSignature

        let name: MethodSignature
        let parameters: [Parameter<Any>]

        static func showHomeScene() -> Method {
            return Method(name: .showHomeScene, parameters: [])
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
}
