//
//  main.swift
//  1 - Two Sum
//
//  Created by Shawn Frank on 13/4/2025.
//
// https://leetcode.com/problems/two-sum/description/
// https://www.youtube.com/watch?v=KLlXCFG5TnA

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var hashmap = [Int: Int]() // [value: index]
    
    for (index, num) in nums.enumerated() {
        let remainder = target - num
        
        if let remainderIndex = hashmap[remainder] {
            return [index, remainderIndex]
        }
        
        hashmap[num] = index
    }
    
    return []
}

print(twoSum([2,7,11,15], 9))
print(twoSum([3,2,4], 6))
print(twoSum([3,3], 6))
