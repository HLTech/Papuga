//
//  Failure.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 06/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import XCTest

func failTest(_ message: String, file: StaticString = #file, line: UInt = #line) {
    XCTFail(message, file: file, line: line)
}

func failure(_ message: String, file: StaticString = #file, line: UInt = #line) -> Never {
    XCTFail(message, file: file, line: line)
    exit(0)
}
