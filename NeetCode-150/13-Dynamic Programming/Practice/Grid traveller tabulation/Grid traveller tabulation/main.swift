//
//  main.swift
//  Grid traveller tabulation
//
//  Created by Shawn Frank on 6/5/2025.
//

import Foundation

func gridTraveller(rows: Int, cols: Int) -> Int {
    var grid = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
    
    grid[1][1] = 1
    
    for row in 0 ... rows {
        
        for col in 0 ... cols {
            
            let nextRow = row + 1
            let nextCol = col + 1
            
            if nextCol < grid[row].count {
                grid[row][nextCol] += grid[row][col]
            }
            
            if nextRow < grid.count {
                grid[nextRow][col] += grid[row][col]
            }
        }
    }
    
    return grid[rows][cols]
}

print(gridTraveller(rows: 1, cols: 1)) // 1
print(gridTraveller(rows: 2, cols: 3)) // 3
print(gridTraveller(rows: 3, cols: 3)) // 6
print(gridTraveller(rows: 18, cols: 18)) // 2333606220

