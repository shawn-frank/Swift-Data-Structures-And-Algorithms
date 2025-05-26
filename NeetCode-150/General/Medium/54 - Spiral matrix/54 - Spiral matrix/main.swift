//
//  main.swift
//  54 - Spiral matrix
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/spiral-matrix/description/

import Foundation

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    
    var topIndex = 0
    var bottomIndex = matrix.count - 1
    var leftIndex = 0
    var rightIndex = matrix[0].count - 1
    
    var result = [Int]()
    
    while topIndex <= bottomIndex && leftIndex <= rightIndex {
        // Go right
        var currLeftIndex = leftIndex
        while currLeftIndex <= rightIndex {
            result.append(matrix[topIndex][currLeftIndex])
            currLeftIndex += 1
        }
        
        topIndex += 1
        
        // Go down
        var currTopIndex = topIndex
        while currTopIndex <= bottomIndex {
            result.append(matrix[currTopIndex][rightIndex])
            currTopIndex += 1
        }
        
        rightIndex -= 1
        
        // Go left
        var currRightIndex = rightIndex
        while currRightIndex >= leftIndex && topIndex <= bottomIndex {
            result.append(matrix[bottomIndex][currRightIndex])
            currRightIndex -= 1
        }
        
        bottomIndex -= 1
        
        // Go up
        var currBottomIndex = bottomIndex
        while currBottomIndex >= topIndex && leftIndex <= rightIndex {
            result.append(matrix[currBottomIndex][leftIndex])
            currBottomIndex -= 1
        }
        
        leftIndex += 1
    }
    
    return result
}

print(spiralOrder([[1,2,3],[4,5,6],[7,8,9]]))
print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))
