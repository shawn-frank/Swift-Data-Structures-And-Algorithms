//
//  main.swift
//  494 - Target sum
//
//  Created by Shawn Frank on 29/5/2025.
//
//  https://leetcode.com/problems/target-sum/

import Foundation

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    
    func findTargetSumWaysInternal(nums: [Int], target: Int, curr: Int = 0) -> Int {
        guard let currentNumber = nums.first else {
            if curr == target { return 1 }
            return 0
        }
        
        let numSlice = Array(nums.dropFirst())
        let waysAdd = findTargetSumWaysInternal(nums: numSlice,
                                                target: target,
                                                curr: curr + currentNumber)
        
        let waysSub = findTargetSumWaysInternal(nums: numSlice,
                                                target: target,
                                                curr: curr - currentNumber)
        
        return waysSub + waysAdd
    }
    
    return findTargetSumWaysInternal(nums: nums, target: target)
}

print(findTargetSumWays([1,1,1,1,1], 3)) // 5
print(findTargetSumWays([1], 1)) // 1
