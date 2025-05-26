//
//  main.swift
//  198 - House robber
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/house-robber/description/

import Foundation

func rob(_ nums: [Int]) -> Int {
    
    var memo = [Int: Int]()
    
    func robInternal(_ nums: [Int], startingFrom house: Int = 0) -> Int {
        guard house < nums.count else { return 0 }
        
        if let previousRobbedAmount = memo[house] {
            return previousRobbedAmount
        }
        
        guard house < nums.count - 1 else { return nums[house] }
        
        var maxAmountRobbed = nums[house]
        
        for index in house + 2 ..< nums.count {
            let amountRobbed = nums[house] + robInternal(nums, startingFrom: index)
            maxAmountRobbed = max(maxAmountRobbed, amountRobbed)
        }
        
        memo[house] = maxAmountRobbed
        
        return maxAmountRobbed
    }
    
    return max(robInternal(nums, startingFrom: 0), robInternal(nums, startingFrom: 1))
}

print(rob([1,2,3,1])) // 4
print(rob([2,7,9,3,1])) // 12
