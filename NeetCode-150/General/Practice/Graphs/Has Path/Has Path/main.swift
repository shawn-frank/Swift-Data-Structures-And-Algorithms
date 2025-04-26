//
//  main.swift
//  Has Path
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation

func hasPath(graph: [String: [String]], src: String, dst: String) -> Bool {
    guard src != dst else { return true }
    
    for neighbour in graph[src, default: []] {
        if hasPath(graph: graph, src: neighbour, dst: dst) {
            return true
        }
    }
    
    return false
}

let graph = [
    "f": ["g", "i"],
    "g": ["h"],
    "h": [],
    "i": ["g", "k"],
    "j": ["i"],
    "k": []
]

print(hasPath(graph: graph, src: "f", dst: "k"))
print(hasPath(graph: graph, src: "j", dst: "f"))
