//
//  main.swift
//  Graph Practice
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation

func dfs(_ graph: [String: [String]],from root: String) {
    
    func dfs(from root: String) {
        guard let neighbours = graph[root] else { return }
        
        print(root)
        
        for node in neighbours {
            dfs(from: node)
        }
    }
    
    dfs(from: root)
}

func bfs(_ graph: [String: [String]], from root: String) {
    var queue = [root]
    
    while !queue.isEmpty {
        guard let currentNode = queue.first else { return }
        
        queue.removeFirst()
        print(currentNode)
        
        for neighbour in graph[currentNode, default: []] {
            queue.append(neighbour)
        }
    }
}

let graph = [
    "a": ["b", "c"],
    "b": ["d"],
    "c": ["e"],
    "d": ["f"],
    "e": [],
    "f": []
]

dfs(graph, from: "a")

print()
print()

bfs(graph, from: "a")


