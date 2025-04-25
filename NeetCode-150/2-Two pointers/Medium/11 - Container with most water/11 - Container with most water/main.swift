//
//  main.swift
//  11 - Container with most water
//
//  Created by Shawn Frank on 23/4/2025.
//
//  https://leetcode.com/problems/container-with-most-water/description/
//  https://www.youtube.com/watch?v=UuiTKBwPgAo&ab_channel=NeetCode

import Foundation

func maxArea(_ height: [Int]) -> Int {
    var maxArea = 0
    var startIndex = 0
    var endIndex = height.count - 1
    
    while startIndex < endIndex {
        let length = endIndex - startIndex
        let breadth = min(height[startIndex], height[endIndex])
        maxArea = max(maxArea, length * breadth)
        
        if height[startIndex] <= height[endIndex] {
            startIndex += 1
        } else {
            endIndex -= 1
        }
    }
    
    return maxArea
}

print(maxArea([1,8,6,2,5,4,8,3,7]))
print(maxArea([1,1]))
