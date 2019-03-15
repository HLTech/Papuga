//
//  ViewRouting.swift
//  iOSExample
//
//  Created by Kamil Wyszomierski on 14/12/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import UIKit

typealias EmptyClosure = () -> Void
typealias ValueClosure<T> = (_ value: T) -> Void

// sourcery: AutoMockable
protocol ViewRouting {

    var window: UIWindow { get }

    func showHomeScene()
    func showLoginScene(completion: @escaping () -> Void)
    func showLogoutScene(completion: @escaping EmptyClosure)
    func showUnauthorizedUserScene(success: @escaping EmptyClosure, failure: @escaping ValueClosure<Error>)
}
