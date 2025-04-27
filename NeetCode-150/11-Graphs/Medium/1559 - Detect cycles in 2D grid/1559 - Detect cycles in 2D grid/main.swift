//
//  main.swift
//  1559 - Detect cycles in 2D grid
//
//  Created by Shawn Frank on 27/4/2025.
//
//  https://leetcode.com/problems/detect-cycles-in-2d-grid/

import Foundation

struct Index: Hashable {
    let row: Int
    let column: Int
}

func containsCycle(_ grid: [[Character]]) -> Bool {
    
    var visited = Set<Index>()
    
    func isValid(_ index: Index) -> Bool {
        index.row >= 0 && index.row < grid.count && index.column >= 0 && index.column < grid[0].count
    }
    
    func containsCycle(from nodeIndex: Index,
                       parentIndex: Index? = nil,
                       traversalSet: inout Set<Index>) -> Bool {
        // Avoid redundant logic
        guard !visited.contains(nodeIndex) else { return false }
        
        // Check if we have a cycle
        guard !traversalSet.contains(nodeIndex) else { return true }
        
        traversalSet.insert(nodeIndex)
        
        let topIndex = Index(row: nodeIndex.row - 1, column: nodeIndex.column)
        let bottomIndex = Index(row: nodeIndex.row + 1, column: nodeIndex.column)
        let leftIndex = Index(row: nodeIndex.row, column: nodeIndex.column - 1)
        let rightIndex = Index(row: nodeIndex.row, column: nodeIndex.column + 1)
        
        // Go back
        if isValid(leftIndex) && leftIndex != parentIndex
            && grid[leftIndex.row][leftIndex.column] == grid[nodeIndex.row][nodeIndex.column] {
            if containsCycle(from: leftIndex, parentIndex: nodeIndex, traversalSet: &traversalSet) {
                return true
            }
        }
        
        // Go forward
        if isValid(rightIndex) && rightIndex != parentIndex
            && grid[rightIndex.row][rightIndex.column] == grid[nodeIndex.row][nodeIndex.column] {
            if containsCycle(from: rightIndex, parentIndex: nodeIndex, traversalSet: &traversalSet) {
                return true
            }
        }
        
        // Go up
        if isValid(topIndex) && topIndex != parentIndex
            && grid[topIndex.row][topIndex.column] == grid[nodeIndex.row][nodeIndex.column]  {
            if containsCycle(from: topIndex, parentIndex: nodeIndex, traversalSet: &traversalSet) {
                return true
            }
        }
        
        // Go down
        if isValid(bottomIndex) && bottomIndex != parentIndex
            && grid[bottomIndex.row][bottomIndex.column] == grid[nodeIndex.row][nodeIndex.column] {
            if containsCycle(from: bottomIndex, parentIndex: nodeIndex, traversalSet: &traversalSet) {
                return true
            }
        }
        
        visited.insert(nodeIndex)
        traversalSet.remove(nodeIndex)
        
        return false
    }
    
    for row in 0 ..< grid.count {
        for column in 0 ..< grid[row].count {
            
            var traversalSet = Set<Index>()
            
            if containsCycle(from: Index(row: row, column: column), traversalSet: &traversalSet) {
                return true
            }
        }
    }
    
    return false
}

// True
print(containsCycle([["a","a","a","a"],["a","b","b","a"],["a","b","b","a"],["a","a","a","a"]]))

// True
print(containsCycle([["c","c","c","a"],["c","d","c","c"],["c","c","e","c"],["f","c","c","c"]]))

// False
print(containsCycle([["a","b","b"],["b","z","b"],["b","b","a"]]))
