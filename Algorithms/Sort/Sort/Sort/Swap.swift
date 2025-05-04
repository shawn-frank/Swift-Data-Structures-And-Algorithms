//
//  Swap.swift
//  Sort
//
//  Created by Shawn Frank on 4/5/2025.
//

extension MutableCollection where Element: Comparable {
    mutating func swap(_ indexOne: Index, _ indexTwo: Index) {
        let temp = self[indexOne]
        self[indexOne] = self[indexTwo]
        self[indexTwo] = temp
    }
}
