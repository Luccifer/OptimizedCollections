//
//  BTreeTests.swift
//  OptimizedCollectionsTests
//
//  Created by Gleb Karpushkin on 20/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

import XCTest
@testable import OptimizedCollections

public class BTreeTests: XCTestCase {
    
    public func test() {
        test1() 
    }
    
    private func test1() {
        
        var set = BTree<Int>(order: 5)
        for i in (1 ... 250).shuffled() {
            set.insert(i)
        }
        
        let evenMembers = set.reversed().lazy.filter { $0 % 2 == 0 }.map { "\($0)" }.joined(separator: ", ")
        
        XCTAssertFalse(evenMembers.split(separator: ",").contains("199"), "BTrees test failed on checking even numbers")
        XCTAssertFalse(evenMembers.split(separator: ",").first == "2", "BTrees test failed on checking even numbers")

    }
}
