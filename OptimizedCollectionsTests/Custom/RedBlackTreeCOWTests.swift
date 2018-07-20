//
//  RedBlackTreeCOWTests.swift
//  OptimizedCollectionsTests
//
//  Created by Gleb Karpushkin on 20/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

import XCTest
@testable import OptimizedCollections

public class RedBlackTreeCOWTests: XCTestCase {
    
    public func test() {
        test1()
    }
    
    private func test1() {
        
        var set = RedBlackTreeCOW<Int>()
        
        for i in (1 ... 20).shuffled() {
            set.insert(i)
        }
        
        XCTAssertTrue(set.contains(13), "Red Black Trees test failed on checking contains")
        XCTAssertFalse(set.contains(42), "Red Black Trees test failed on checking contains")
        
        XCTAssertTrue(set.filter { $0 % 2 == 0} == [2, 4, 6, 8, 10, 12, 14, 16, 18, 20], "Red Black Trees test failed on checking filter")
        
    }
}
