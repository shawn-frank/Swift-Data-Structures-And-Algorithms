//
//  main.swift
//  Binary search
//
//  Created by Shawn Frank on 13/4/2025.
//

// https://leetcode.com/problems/binary-search/description/
// https://www.youtube.com/watch?v=s4DPM8ct1pI

import Foundation

func findRecursive(_ value: Int, in input: [Int]) -> Bool {
    let mid = input.count / 2
    
    if input[mid] == value {
        return true
    }
    
    if value > input[mid] && mid < input.count - 1 {
        let secondSlice = input[mid+1 ..< input.count]
        return findRecursive(value, in: Array(secondSlice))
    }
    
    if value < input[mid] && mid > 0 {
        let firstSlice = input[0 ..< mid]
        return findRecursive(value, in: Array(firstSlice))
    }
    
    return false
}

 // Preferred
func find(_ target: Int, in nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if nums[mid] == target {
            return mid
        }
        
        if target > nums[mid] {
            left = mid + 1
            continue
        }
        
        if target < nums[mid] {
            right = mid - 1
            continue
        }
    }
    
    return -1
}


print(findRecursive(4, in: [1,2,3,4]))
print(findRecursive(4, in: [1,2,3,4,5]))
print(findRecursive(8, in: [1,2,3,4]))
print(findRecursive(8, in: [1,2,3,4,5]))

print(find(4, in: [1,2,3,4]))
print(find(4, in: [1,2,3,4,5]))
print(find(8, in: [1,2,3,4]))
print(find(8, in: [1,2,3,4,5]))

