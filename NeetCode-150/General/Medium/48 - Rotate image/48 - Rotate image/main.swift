//
//  main.swift
//  48 - Rotate image
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/rotate-image/description/

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    // Transpose
    for row in 0 ..< matrix.count {
        for col in row ..< matrix[row].count {
            let temp = matrix[row][col]
            matrix[row][col] = matrix[col][row]
            matrix[col][row] = temp
        }
    }
    
    // Swap elements in each row
    for row in 0 ..< matrix.count {
        var columnStart = 0
        var columnEnd = matrix[row].count - 1
        
        while columnStart <= columnEnd {
            let temp = matrix[row][columnStart]
            matrix[row][columnStart] = matrix[row][columnEnd]
            matrix[row][columnEnd] = temp
            
            columnStart += 1
            columnEnd -= 1
        }
    }
}

var originalImageOne = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
rotate(&originalImageOne)
print(originalImageOne)

var originalImageTwo = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&originalImageTwo)
print(originalImageTwo)
