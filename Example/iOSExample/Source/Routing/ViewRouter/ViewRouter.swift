//
//  ViewRouter.swift
//  iOSExample
//
//  Created by Kamil Wyszomierski on 14/12/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import UIKit

class ViewRouter: ViewRouting {

    // MARK: - Properties

    let window: UIWindow

    // MARK: - Initialization

    init(window: UIWindow) {
        self.window = window
    }

    func showHomeScene() {
        window.rootViewController = HomeViewController()
        window.makeKeyAndVisible()
    }
}
