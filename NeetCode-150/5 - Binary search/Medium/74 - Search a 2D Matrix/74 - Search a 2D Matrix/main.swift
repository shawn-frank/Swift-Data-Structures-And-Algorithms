//
//  main.swift
//  74 - Search a 2D Matrix
//
//  Created by Shawn Frank on 29/5/2025.
//
//  https://leetcode.com/problems/search-a-2d-matrix/

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    var start = 0
    var end = (matrix.count * matrix[0].count) - 1
    var itemsInRow = matrix[0].count
    
    while start <= end {
        let mid = Int((start + end) / 2)
        
        let rowIndex = Int(mid / itemsInRow)
        let columnIndex = Int(mid - (itemsInRow * rowIndex))
        
        if matrix[rowIndex][columnIndex] == target { return true }
        
        if target > matrix[rowIndex][columnIndex]  {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return false
}

