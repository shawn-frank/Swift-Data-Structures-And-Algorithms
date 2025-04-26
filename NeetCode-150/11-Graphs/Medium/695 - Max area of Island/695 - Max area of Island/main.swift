//
//  main.swift
//  695 - Max area of Island
//
//  Created by Shawn Frank on 27/4/2025.
//
//  https://leetcode.com/problems/max-area-of-island/description/
//  https://youtu.be/tWVWeAqZ0WU?si=NAzFf5gTXnOqcPMm&t=7129

import Foundation

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    
    var largestIsland = 0
    
    var visited = Set<String>()
    
    func dfs(of grid: [[Int]], row: Int, column: Int) -> Int {
        
        guard !visited.contains( "\(row),\(column)" ),
              row >= 0, row < grid.count,
              column >= 0, column < grid[row].count,
              grid[row][column] == 1 else {
            return 0
        }
        
        visited.insert( "\(row),\(column)" )
        
        var nodesInIsland = 1
        
        // Go left
        nodesInIsland += dfs(of: grid, row: row - 1, column: column)
        
        // Go right
        nodesInIsland += dfs(of: grid, row: row + 1, column: column)
        
        // Go up
        nodesInIsland += dfs(of: grid, row: row, column: column - 1)
        
        // Go down
        nodesInIsland += dfs(of: grid, row: row, column: column + 1)
        
        return nodesInIsland
    }
    
    for row in 0 ..< grid.count {
        
        for column in 0 ..< grid[row].count {
            
            guard grid[row][column] == 1 else { continue }
            
            let islandSize = dfs(of: grid, row: row, column: column)
            
            largestIsland = max(largestIsland, islandSize)
        }
        
    }
    
    return largestIsland
}


let gridOne = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]

let gridTwo = [[0,0,0,0,0,0,0,0]]

print(maxAreaOfIsland(gridOne))
print(maxAreaOfIsland(gridTwo))
