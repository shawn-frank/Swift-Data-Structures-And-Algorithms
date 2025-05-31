//
//  main.swift
//  53 - Maximum subaaray
//
//  Created by Shawn Frank on 31/5/2025.
//
//  https://leetcode.com/problems/maximum-subarray/
//
//  https://www.youtube.com/watch?v=86CQq3pKSUw&ab_channel=CSDojo

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var maxSum = nums[0]
    var currentSum = maxSum
    
    for index in 1 ..< nums.count {
        currentSum = max(currentSum + nums[index], nums[index])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}

print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
print(maxSubArray([1])) // 1
print(maxSubArray([5,4,-1,7,8])) // 23
