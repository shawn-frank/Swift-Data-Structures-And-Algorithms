//
//  main.swift
//  Largest component
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation

func largestComponent(in graph: [Int: [Int]]) -> Int {
    guard !graph.isEmpty else { return 0 }
    
    var largest = 0
    
    var visited = Set<Int>()
    
    @discardableResult func largestComponent(in graph: [Int: [Int]], root: Int) -> Int {
        guard !visited.contains(root) else { return 0 }
        
        visited.insert(root)
        
        var components = 0
        
        for neighbour in graph[root, default: []] {
            components += largestComponent(in: graph, root: neighbour)
        }
        
        return components + 1
    }
    
    for node in graph.keys {
        largest = max(largestComponent(in: graph, root: node), largest)
    }
    
    return largest
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

print(largestComponent(in: graphOne))
print(largestComponent(in: graphTwo))
