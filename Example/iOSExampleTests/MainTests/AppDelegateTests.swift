//
//  AppDelegateTests.swift
//  iOSExampleTests
//
//  Created by Kamil Wyszomierski on 13/12/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import XCTest
import Papuga
@testable import iOSExample

class AppDelegateTests: XCTestCase {

    // MARK: - Parameter

    private var sut: AppDelegate!
    private var viewRoutingMock: ViewRoutingMock!

    // MARK: - Setups

    override func setUp() {
        let viewRoutingMock = ViewRoutingMock()
        sut = AppDelegate()
        sut.viewRouter = viewRoutingMock
        self.viewRoutingMock = viewRoutingMock
    }

    // MARK: - Tests

    func test_if_viewRouter_calls_showHomeScene_when_app_finish_launching() {

        // Given

        // When
        _ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)

        // Then
        Parameter<Int>.value(1)
        viewRoutingMock.verify(method: .showHomeScene(), whichNumberOfCallsIs: 1)
    }
}
