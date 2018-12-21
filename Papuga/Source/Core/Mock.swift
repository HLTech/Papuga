//
//  Mock.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 07/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

open class Mock {

    let file: StaticString
    let line: UInt

    public init(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }
}
