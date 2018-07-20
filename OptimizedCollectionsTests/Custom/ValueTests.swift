//
//  ValueTests.swift
//  OptimizedCollectionsTests
//
//  Created by Gleb Karpushkin on 19/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

@testable import OptimizedCollections
import XCTest

public class ValueTests: XCTestCase {
    
    private let value = Value(42)
    
    public func test() {
        test1()
    }
    
    private func test1() {
        let a = value as AnyObject
        let b = value as AnyObject
        XCTAssertFalse(a.isEqual(b), "Value tests failed on checking equality")
//        XCTAssertFalse.hash == 140446814106272, "Value tests failed on checking hash")
        XCTAssertTrue(a.hash != b.hash, "Value tests failed on checking hash equality")
    }
    
    private func test2() {
        var values = OrderedSet<Value>()
        (1...20).shuffled().map(Value.init).forEach {values.insert($0)}
        XCTAssertTrue(values.contains(Value(7)), "Value tests failed on checking contains")
        XCTAssertFalse(values.contains(Value(42)), "Value tests failed on checking contains")
    }
}

