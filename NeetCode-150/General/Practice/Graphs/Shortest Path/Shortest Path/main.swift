//
//  main.swift
//  Shortest Path
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation

func shortestPath(in edges: [[String]], src: String, dst: String) -> Int {
    let graph = buildGraph(from: edges)
    
    guard !graph.isEmpty else { return 0 }
    
    var queue = [ (node: src, pathSize: 0) ]
    
    var visited = Set<String>()
    
    while !queue.isEmpty {
        guard let current = queue.first else { return 0 }
        
        guard current.node != dst else { return current.pathSize }
        
        visited.insert(current.node)
        queue.removeFirst()
        
        for neighbour in graph[current.node, default: []] {
            guard !visited.contains(neighbour) else { continue }
            queue.append( (neighbour, current.pathSize + 1) )
        }
    }
    
    return 0
}

func buildGraph(from edges: [[String]]) -> [String: [String]] {
    var graph = [String: [String]]()
    
    edges.forEach { pair in
        guard let first = pair.first,
              let last = pair.last else {
            return
        }
        
        graph[first, default: []].append(last)
        graph[last, default: []].append(first)
    }
    
    return graph
}

let edges = [
    ["w", "x"],
    ["x", "y"],
    ["z", "y"],
    ["z", "v"],
    ["w", "v"],
]

let edgesTwo = [
    ["w", "j"],
    ["v", "w"],
    ["w", "j"],
    ["j", "x"],
    ["z", "y"],
    ["z", "v"],
]

print(shortestPath(in: edges, src: "w", dst: "z"))
print(shortestPath(in: edgesTwo, src: "v", dst: "x"))
