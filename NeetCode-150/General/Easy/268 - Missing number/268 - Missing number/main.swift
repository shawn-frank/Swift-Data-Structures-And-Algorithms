//
//  main.swift
//  268 - Missing number
//
//  Created by Shawn Frank on 4/6/2025.
//
//  https://leetcode.com/problems/missing-number/

import Foundation

func missingNumber(_ nums: [Int]) -> Int {
    var expectedSum = 0
    
    for num in 0 ... nums.count {
        expectedSum += num
    }
    
    var actualSum = 0
    
    for num in nums {
        actualSum += num
    }
    
    return expectedSum - actualSum
}

print(missingNumber([3,0,1])) // 2
print(missingNumber([0,1])) // 2
print(missingNumber([9,6,4,2,3,5,7,0,1])) // 8
