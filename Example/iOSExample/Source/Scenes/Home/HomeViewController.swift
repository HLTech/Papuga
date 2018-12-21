//
//  ViewController.swift
//  iOSExample
//
//  Created by Kamil Wyszomierski on 13/12/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    typealias View = HomeView

    // MARK: - Properties

    private(set) weak var baseView: View?

    // MARK: - Lifecycle

    override func loadView() {
        view = View()
        baseView = view as? View
    }
}
