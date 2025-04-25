//
//  main.swift
//  Contains Duplicate
//
//  Created by Shawn Frank on 12/4/2025.
//
// https://leetcode.com/problems/contains-duplicate/description/
// https://www.youtube.com/watch?v=3OamzN90kPg

import Foundation

func hasDuplicate(_ nums: [Int]) -> Bool {
    var seen: Set<Int> = []
    
    for num in nums {
        if seen.contains(num) {
            return true
        }
        
        seen.insert(num)
    }
    
    return false
}

// MARK: Alternatives
// 1 - use a hashmap
// 2 - store all items in a set and then compare if the count is the same as the input


print(hasDuplicate([2, 4, 3, 4]))
print(hasDuplicate([3, 4, 5]))
print(hasDuplicate([1]))
print(hasDuplicate([3, 4, 5, 6, 7, 3, 4, 6]))
