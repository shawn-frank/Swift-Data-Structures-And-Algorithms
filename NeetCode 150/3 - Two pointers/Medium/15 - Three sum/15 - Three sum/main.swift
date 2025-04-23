//
//  main.swift
//  15 - Three sum
//
//  Created by Shawn Frank on 23/4/2025.
//  https://leetcode.com/problems/3sum/description/
//  https://www.youtube.com/watch?v=jzZsG8n2R9A&ab_channel=NeetCode

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    
    let sortedNums = nums.sorted() // n log n
    
    for (currentIndex, num) in sortedNums.enumerated() {
        if currentIndex > 0 && num == sortedNums[currentIndex - 1] { continue }
        
        var startIndex = currentIndex + 1
        var endIndex = sortedNums.count - 1
        
        while startIndex < endIndex {
            if startIndex == currentIndex {
                startIndex += 1
                continue
            }
            
            if endIndex == currentIndex {
                endIndex -= 1
                continue
            }
            
            let currentSum = num + sortedNums[startIndex] + sortedNums[endIndex]
            
            if currentSum == 0 {
                result.append([num, sortedNums[startIndex], sortedNums[endIndex]])
                startIndex += 1
                
                while sortedNums[startIndex] == sortedNums[startIndex - 1] && startIndex < endIndex {
                    startIndex += 1
                }
                
                continue
            }
            
            if currentSum > 0 {
                endIndex -= 1
                continue
            }
            
            if currentSum < 0 {
                startIndex += 1
                continue
            }
        }
    }
    
    return result
}
    
print(threeSum([-1,0,1,2,-1,-4]))
