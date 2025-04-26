//
//  main.swift
//  Count connected components
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation

func countConnectedComponents(in graph: [Int: [Int]]) -> Int {
    guard !graph.isEmpty else { return 0 }
    
    var connectedComponents = 0
    var visited = Set<Int>()
    
    @discardableResult func countConnectedComponents(in graph: [Int: [Int]], root: Int) -> Bool {
        guard !visited.contains(root) else { return false }
        
        visited.insert(root)
        
        for neighbour in graph[root, default: []] {
            countConnectedComponents(in: graph, root: neighbour)
        }
        
        return true
    }
    
    for node in graph.keys {
        if countConnectedComponents(in: graph, root: node) {
            connectedComponents += 1
        }
    }
    
    return connectedComponents
}

let graphOne = [
    3: [],
    4: [6],
    6: [4, 5, 7, 8],
    8: [6],
    7: [6],
    5: [6],
    1: [2],
    2: [1]
]

let graphTwo = [
    1: [2],
    2: [1, 3],
    3: [2, 4],
    4: [3, 5],
    5: [4, 2],
    6: [7],
    7: [8, 6],
    8: [7],
]

print(countConnectedComponents(in: graphOne))
print(countConnectedComponents(in: graphTwo))
