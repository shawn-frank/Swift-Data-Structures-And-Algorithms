//
//  main.swift
//  Undirected Path
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation

func undirectedPath(in edges: [[String]], src: String, dst: String) -> Bool {
    let graph = buildGraph(edges)
    var visited = Set<String>()
    
    func undirectedPath(in graph: [String: [String]], src: String, dst: String) -> Bool {
        guard src != dst else { return true }
        
        guard !visited.contains(src) else { return false }
        
        visited.insert(src)
        
        for neighbour in graph[src, default: []] {
            if undirectedPath(in: graph, src: neighbour, dst: dst) {
                return true
            }
        }
        
        return false
    }
    
    return undirectedPath(in: graph, src: src, dst: dst)
    
}

private func buildGraph(_ edges: [[String]]) -> [String: [String]] {
    var graph = [String: [String]]()
    
    edges.forEach { pair in
        guard let firstNode = pair.first,
              let lastNode = pair.last else {
            return
        }
        
        graph[firstNode, default: []].append(lastNode)
        graph[lastNode, default: []].append(firstNode)
    }
    
    return graph
}

let edges = [
    ["i", "j"],
    ["k", "i"],
    ["m", "k"],
    ["k", "l"],
    ["o", "n"],
]

print(undirectedPath(in: edges, src: "j", dst: "m"))
print(undirectedPath(in: edges, src: "j", dst: "o"))
