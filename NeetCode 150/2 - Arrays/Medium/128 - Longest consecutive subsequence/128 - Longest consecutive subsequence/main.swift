//
//  main.swift
//  128 - Longest consecutive subsequence
//
//  Created by Shawn Frank on 23/4/2025.
//
// https://www.youtube.com/watch?v=P6RZZMu_maU&ab_channel=NeetCode
// https://leetcode.com/problems/longest-consecutive-sequence/description/

import Foundation

// I: [100,4,200,1,3,2]
// O: 4

func longestConsecutive(_ nums: [Int]) -> Int {
    let numsSet = Set(nums)
    var longestSubsequence = 0
    
    for num in numsSet {
        let oneLess = num - 1
        guard !numsSet.contains(oneLess) else { continue }
        
        var currentSubsequenceLength = 1
        var currentSequenceValue = num
        
        while true {
            currentSequenceValue += 1
            if numsSet.contains(currentSequenceValue) {
                currentSubsequenceLength += 1
            } else {
                break
            }
        }
        
        longestSubsequence = max(longestSubsequence, currentSubsequenceLength)
    }
    
    return longestSubsequence
}

print(longestConsecutive([100,4,200,1,3,2]))
print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
print(longestConsecutive([1,0,1,2]))

