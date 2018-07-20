//
//  OptimizedCollectionsTests.swift
//  OptimizedCollectionsTests
//
//  Created by Gleb Karpushkin on 19/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

import XCTest
@testable import OptimizedCollections

class OptimizedCollectionsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        ValueTests().test()
        RedBlackTreeCOWTests().test()
        BTreeTests().test()
        SortedArrayTests().test()
        OrderedSetTests().test()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
