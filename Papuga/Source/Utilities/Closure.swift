//
//  Closure.swift
//  SourceryExampleTests
//
//  Created by Kamil Wyszomierski on 15/11/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import Foundation

public struct Closure {

    public typealias Empty = () -> Void
    public typealias ValueReturn<V, R> = ( _ value: V ) -> R
    public typealias ValueVoid<V> = ( _ value: V ) -> Void
}
