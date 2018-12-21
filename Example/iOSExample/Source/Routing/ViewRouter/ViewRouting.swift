//
//  ViewRouting.swift
//  iOSExample
//
//  Created by Kamil Wyszomierski on 14/12/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import UIKit

// sourcery: AutoMockable
protocol ViewRouting {

    var window: UIWindow { get }

    func showHomeScene()
}
