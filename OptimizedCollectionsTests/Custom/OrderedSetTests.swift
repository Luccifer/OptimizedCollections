//
//  OrderedSetTests.swift
//  OptimizedCollectionsTests
//
//  Created by Gleb Karpushkin on 19/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

import XCTest
@testable import OptimizedCollections

class OrderedSetTests: XCTestCase {
    
    private var set = OrderedSet<Int>()
    
    public func test() {
        test1()
        test2()
    }
    
    private func test1() {
        for i in (1...20).shuffled() {
            set.insert(i)
        }
        XCTAssertTrue(set.contains(7), "Ordered Set test failed on checking insertion")
        XCTAssertFalse(set.contains(42), "Ordered Set test failed on checking insertion")
        XCTAssertTrue(set.reduce(0, +) == 210, "Ordered Set test failed on checking reduce")
    }
    
    private func test2() {
        let copy = set
        set.insert(42)
        XCTAssertTrue(set.contains(42), "Ordered Set test failed on checking memory collision")
        XCTAssertFalse(copy.contains(42), "Ordered Set test failed on checking memory collision")
    }
}
