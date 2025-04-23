//
//  main.swift
//  167 - Two Sum 2
//
//  Created by Shawn Frank on 23/4/2025.
//
//  https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/
//  https://www.youtube.com/shorts/ms1cRGi69Mk

import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    var startIndex = 0
    var endIndex = numbers.count - 1
    var result = [Int]()
    
    while startIndex < endIndex {
        let currentSum = numbers[startIndex] + numbers[endIndex]
        
        if currentSum == target { return [startIndex + 1, endIndex + 1] }
        
        if target > currentSum {
            startIndex += 1
            continue
        }
        
        if target < currentSum {
            endIndex -= 1
            continue
        }
    }
    
    return []
}

