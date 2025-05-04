//
//  main.swift
//  75 - Sort Colors
//
//  Created by Shawn Frank on 4/5/2025.
//
//  https://leetcode.com/problems/sort-colors/
//  https://www.youtube.com/watch?v=OOP-5rMp6z0&ab_channel=AnimatedAlgorithms

import Foundation

func sortColors(_ nums: inout [Int]) {
    var lowIndex = 0
    var midIndex = 0
    var highIndex = nums.count - 1
    
    while midIndex <= highIndex {
        
        if nums[midIndex] == 0 {
            nums.swapAt(lowIndex, midIndex)
            lowIndex += 1
            midIndex += 1
            continue
        }
        
        if nums[midIndex] == 1 {
            midIndex += 1
            continue
        }
        
        if nums[midIndex] == 2 {
            nums.swapAt(midIndex, highIndex)
            highIndex -= 1
        }
        
    }
}

var colors = [2,0,2,1,1,0]
sortColors(&colors)
print(colors)

colors = [2,0,1]
sortColors(&colors)
print(colors)

