//
//  main.swift
//  200 - Number of Islands
//
//  Created by Shawn Frank on 26/4/2025.
//
//  https://leetcode.com/problems/number-of-islands/
//  https://youtu.be/tWVWeAqZ0WU?si=MPhHIlHqZFnJSBWJ&t=5976

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    
    var islands = 0
    
    var visited = Set<String>()
    
    func dfs(of grid: [[Character]], row: Int, column: Int) {
        
        guard !visited.contains( "\(row),\(column)" ),
              row >= 0, row < grid.count,
              column >= 0, column < grid[row].count,
              grid[row][column] == "1" else { return }
        
        visited.insert( "\(row),\(column)" )
        
        // Up
        dfs(of: grid, row: row - 1, column: column)
        
        // Down
        dfs(of: grid, row: row + 1, column: column)
        
        // Left
        dfs(of: grid, row: row, column: column - 1)
        
        // Right
        dfs(of: grid, row: row, column: column + 1)
    }
    
    for row in 0 ..< grid.count {
        
        for column in 0 ..< grid[row].count {
            
            guard grid[row][column] == "1",
                  !visited.contains( "\(row),\(column)" ) else { continue }
            
            dfs(of: grid, row: row, column: column)
            islands += 1
        }
    }
    
    return islands
}

// 1
let gridOne: [[Character]] = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]

// 3
let gridTwo: [[Character]] = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]

print(numIslands(gridOne))
print(numIslands(gridTwo))
