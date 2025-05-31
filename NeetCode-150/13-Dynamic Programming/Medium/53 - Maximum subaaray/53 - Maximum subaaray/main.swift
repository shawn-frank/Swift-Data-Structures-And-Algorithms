//
//  main.swift
//  53 - Maximum subaaray
//
//  Created by Shawn Frank on 31/5/2025.
//
//  https://leetcode.com/problems/maximum-subarray/

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var memo = [Int: Int]()  // Cache for maxEndingHere(i)
    var globalMax = Int.min
    
    func maxEndingHere(_ i: Int) -> Int {
        if i < 0 { return 0 }
        if let cached = memo[i] { return cached }
        
        let prev = maxEndingHere(i - 1)
        let current = max(nums[i], nums[i] + prev)
        memo[i] = current
        globalMax = max(globalMax, current)
        return current
    }
    
    _ = maxEndingHere(nums.count - 1)
    return globalMax
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
print(maxSubArray([1])) // 1
print(maxSubArray([5,4,-1,7,8])) // 23
