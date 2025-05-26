//
//  main.swift
//  62 - Unique paths
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/unique-paths/description/

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    
    var pathMemo = [Set<Int>: Int]()
    
    func uniquePathsRecursive(_ row: Int, _ col: Int) -> Int {
        if let paths = pathMemo[Set([row, col])] {
            return paths
        }
        
        if row < 0 || col < 0 { return 0 }
        
        if row == 1 && col == 1 { return 1 }
        
        let uniquePaths = uniquePathsRecursive(row - 1, col) +
        uniquePathsRecursive(row, col - 1)
        
        pathMemo[Set([row, col])] = uniquePaths
        
        return uniquePaths
    }
    
    return uniquePathsRecursive(m, n)
}

print(uniquePaths(3, 7)) // 28
print(uniquePaths(3, 2)) // 3
print(uniquePaths(23, 12)) // 193536720

