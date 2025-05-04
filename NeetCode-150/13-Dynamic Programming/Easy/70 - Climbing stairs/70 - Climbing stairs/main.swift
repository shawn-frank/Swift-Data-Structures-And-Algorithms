//
//  main.swift
//  70 - Climbing stairs
//
//  Created by Shawn Frank on 5/5/2025.
//
//  https://leetcode.com/problems/climbing-stairs/
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    
    var stairMemo = [0: 1, 1: 1]
    
    func climbStairsRecursive(_ n: Int) -> Int {
        guard stairMemo[n] == nil else { return stairMemo[n, default: 0] }
        
        guard n >= 0 else { return 0 }
        
        let result = climbStairsRecursive(n - 1) + climbStairsRecursive(n - 2)
        stairMemo[n] = result
        return result
    }
    
    return climbStairsRecursive(n)
}

print(climbStairs(2))
print(climbStairs(3))
