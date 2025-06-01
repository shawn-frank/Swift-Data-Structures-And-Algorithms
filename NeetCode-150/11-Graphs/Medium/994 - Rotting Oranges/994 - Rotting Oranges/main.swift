//
//  main.swift
//  994 - Rotting Oranges
//
//  Created by Shawn Frank on 2/6/2025.
//
//  https://leetcode.com/problems/rotting-oranges/description/

import Foundation

func orangesRotting(_ grid: [[Int]]) -> Int {
    var freshOranges = 0
    var rottenQueue = [(Int, Int)]()
    
    let rows = grid.count
    let columns = grid[0].count
    
    for rowIndex in 0 ..< grid.count {
        for colIndex in 0 ..< grid[rowIndex].count {
            if grid[rowIndex][colIndex] == 1 {
                freshOranges += 1
            }
            
            if grid[rowIndex][colIndex] == 2 {
                rottenQueue.append((rowIndex, colIndex))
            }
        }
    }
    
    // No fresh oranges at minute 0
    guard freshOranges > 0 else { return 0 }
    
    // No rotten oranges so fresh oranges can't be spoilt
    guard rottenQueue.count > 0 else { return -1 }
    
    let rottenOranges = rottenQueue.count
    var mutableGrid = grid
    var currentTime = 0
    
    var directions = [[0, -1], [0, 1], [-1, 0], [1, 0]]
    
    while !rottenQueue.isEmpty && freshOranges > 0 {
        let currentRottenQueueSize = rottenQueue.count
        
        // Helper since we don't have a native queue
        var newPairs = [(Int, Int)]()
        
        for rottenOrangePairIndex in 0 ..< currentRottenQueueSize {
            let (rowIndex, colIndex) = rottenQueue.removeLast()
            
            for direction in directions {
                guard let rowDelta = direction.first,
                      let colDelta = direction.last else { return -1 }
                
                let neighbourRowIndex = rowIndex + rowDelta
                let neighbourColIndex = colIndex + colDelta
                
                guard neighbourRowIndex >= 0, neighbourRowIndex < rows,
                      neighbourColIndex >= 0, neighbourColIndex < columns,
                      mutableGrid[neighbourRowIndex][neighbourColIndex] == 1 else {
                    continue
                }
                
                newPairs.append((neighbourRowIndex, neighbourColIndex))
                mutableGrid[neighbourRowIndex][neighbourColIndex] = 2
                freshOranges -= 1
            }
        }
        
        rottenQueue.append(contentsOf: newPairs)
        currentTime += 1
    }
    
    // Impossible for all oranges to be rotten
    if freshOranges != 0 { return -1 }
    
    return currentTime
}

print(orangesRotting([[2,1,1],[1,1,0],[0,1,1]])) // 4
print(orangesRotting([[2,1,1],[0,1,1],[1,0,1]])) // -1
print(orangesRotting([[0,2]])) // 0
print(orangesRotting([[2,1,1],[1,1,1],[1,1,1]])) // 4
