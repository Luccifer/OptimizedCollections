//
//  SortedSet.swift
//  OptimizedCollections
//
//  Created by Gleb Karpushkin on 19/07/2018.
//  Copyright © 2018 Gleb Karpushkin. All rights reserved.
//

import Foundation

public protocol SortedSet: BidirectionalCollection, CustomStringConvertible where Element: Comparable {
    
    init()
    func contains(_ element: Element) -> Bool
    mutating func insert(_ newElement: Element) -> (inserted: Bool, memberAfterInsert: Element)
}

extension SortedSet {
    public var description: String {
        let contents = self.lazy.map {"\($0)"}.joined(separator: ", ")
        return "[\(contents)]"
    }
}

