//
//  main.swift
//  136 - Single number
//
//  Created by Shawn Frank on 4/6/2025.
//
//  https://leetcode.com/problems/single-number/description/

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    
    for num in nums {
        // a ^ a = a
        // a ^ 0 = 0
        // [2, 2, 1] - 2 and 2 will cancel each other out leaving us with 1
        result = num ^ result
    }
    
    return result
}

print(singleNumber([2,2,1])) // 1
print(singleNumber([4,1,2,1,2])) // 4
print(singleNumber([1])) // 1
