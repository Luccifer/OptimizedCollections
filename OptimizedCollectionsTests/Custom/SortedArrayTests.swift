//
//  SortedArrayTests.swift
//  OptimizedCollectionsTests
//
//  Created by Gleb Karpushkin on 19/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//


@testable import OptimizedCollections
import XCTest

public class SortedArrayTests: XCTestCase {
    
    private var set: SortedArray = SortedArray<Int>()
    
    public func test() {
        test1()
        test2()
        testBenchmark()
    }
    
    private func test1() {
        for i in (0..<22).shuffled() {
            set.insert(2 * i)
        }
        XCTAssertTrue(set.contains(42), "Sorted Array test not passed")
        XCTAssertFalse(set.contains(13), "Sorted Array test not passed")
    }
    
    private func test2() {
        let copy = set
        set.insert(13)
        
        XCTAssertTrue(set.contains(13), "Sorted Array test not passed on insertion check")
        XCTAssertFalse(copy.contains(13), "Sorted Array test not passed on insertion check")
    }
    
    private func testBenchmark() {
        for size in (0 ..< 20).map({ 1 << $0 }) {
            benchmark(count: size) { name, body in
                let start = Date()
                body()
                let end = Date()
                print("\(name), \(size), \(end.timeIntervalSince(start))")
            }
        }
    }
    
    private func benchmark(count: Int, measure: (String, () -> Void) -> Void) {
        var set = SortedArray<Int>()
        let input = (0..<count)
        measure("SortedArray.contains") {
            for value in input {
                set.insert(value)
            }
        }
        
        let lookups = (0..<count)
        measure("SortedArray.contains") {
            for element in lookups {
                guard set.contains(element) else {fatalError()}
            }
        }
        
        measure("SortedArray.forEach") {
            var i = 0
            set.forEach { element in
                guard element == i else {fatalError()}
                i += 1
            }
            guard i == input.count else {fatalError()}
        }
        
        measure("SortedArray.for-in") {
            var i = 0
            for element in set {
                guard element == i else {fatalError()}
                i += 1
            }
            guard i == input.count else {fatalError()}
        }
    }
}
