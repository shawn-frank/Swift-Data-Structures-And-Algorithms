//
//  main.swift
//  209 - Minimum size subarray
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/minimum-size-subarray-sum/

import Foundation

func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
    var startIndex = 0
    var endIndex = 0
    
    var minSubarraySize = Int.max
    var total = 0
    
    while endIndex < nums.count {
        total += nums[endIndex]
        
        while total >= target {
            let subArraySize = endIndex - startIndex + 1
            minSubarraySize = min(minSubarraySize, subArraySize)
            total -= nums[startIndex]
            startIndex += 1
        }
        
        endIndex += 1
    }
    
    guard minSubarraySize != Int.max else { return 0 }
    
    return minSubarraySize
}

print(minSubArrayLen(7, [2,3,1,2,4,3])) // 2
print(minSubArrayLen(4, [1,4,4])) // 1
print(minSubArrayLen(11, [1,1,1,1,1,1,1,1])) // 0
