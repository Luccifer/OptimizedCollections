//
//  Value.swift
//  OptimizedCollections
//
//  Created by Gleb Karpushkin on 19/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

import Foundation

struct Value: Comparable {
    
    let value: Int
    
    init(_ value: Int) {
        self.value = value
    }
    
    static func == (left: Value, right: Value) -> Bool {
        return left.value == right.value
    }
    
    static func < (left: Value, right: Value) -> Bool {
        return left.value < right.value
    }
}
