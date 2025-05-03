//
//  main.swift
//  DisjointSet
//
//  Created by Shawn Frank on 1/5/2025.
//

import Foundation

class DisjointSet<T: Hashable & Comparable> {
    
    enum DisjointSetExceptions: Error {
        case illegalArgumentException
    }
    
    /// Nodes that are connected to each other form a component
    /// A single node is also considered a valid component
    private(set) var numberOfComponents = 0
    
    /// Stores the index of a node in the paths array
    private var nodeMap = [T: Int]()
    
    /// Stores the paths between the different nodes
    private var paths = [Int]()
    
    /// Stores the number of vertices within each component
    /// The root / parent stores the size of the component
    /// This is used to decide which component has more vertices when performing a union
    private var componentSizes = [Int]()
    
    init() { }
    
    init(nodes: [T]) {
        for (index, node) in nodes.enumerated() {
            // Initially, all nodes will point to themselves
            paths.append(index)
            
            nodeMap[node] = index
        }
        
        // Initially, all the components will have a size of 1
        componentSizes = Array(repeating: 1, count: nodes.count)
        
        numberOfComponents = nodes.count
    }
    
    private func findRoot(of node: T) -> Int? {
        var nodeIndex: Int
        
        if let index = nodeMap[node] {
            nodeIndex = index
        } else {
            nodeIndex = createNewNode(node)
        }
        
        while paths[nodeIndex] != nodeIndex {
            nodeIndex = paths[nodeIndex]
        }
        
        // Path compression
        guard var nodeIndexToCompress = nodeMap[node] else { return nil }
        
        while nodeIndexToCompress != nodeIndex {
            let next = paths[nodeIndexToCompress]
            paths[nodeIndexToCompress] = nodeIndex
            nodeIndexToCompress = next
        }
        
        return nodeIndex
    }
    
    private func createNewNode(_ node: T) -> Int {
        let nodeIndex = nodeCount
        nodeMap[node] = nodeIndex
        paths.append(nodeIndex)
        numberOfComponents += 1
        componentSizes.append(1)
        return nodeIndex
    }
}

// MARK: Public interface
extension DisjointSet {
    func unify(_ nodeOne: T, _ nodeTwo: T) -> Bool {
        guard let nodeOneIndex = findRoot(of: nodeOne),
              let nodeTwoIndex = findRoot(of: nodeTwo) else {
            // Error in data structure
            return false
        }
        
        guard nodeOneIndex != nodeTwoIndex else {
            // Part of the same component already
            return false
        }
        
        if componentSizes[nodeOneIndex] < componentSizes[nodeTwoIndex] {
            componentSizes[nodeTwoIndex] += componentSizes[nodeOneIndex]
            paths[nodeOneIndex] = paths[nodeTwoIndex]
        } else {
            componentSizes[nodeOneIndex] += componentSizes[nodeTwoIndex]
            paths[nodeTwoIndex] = paths[nodeOneIndex]
        }
        
        numberOfComponents -= 1
        
        return true
    }
    
    func isConnected(_ nodeOne: T, _ nodeTwo: T) -> Bool {
        findRoot(of: nodeOne) == findRoot(of: nodeTwo)
    }
    
    func componentSize(of node: T) -> Int {
        guard let nodeIndex = findRoot(of: node) else { return 0 }
        return componentSizes[nodeIndex]
    }
    
    /// Number of nodes in this union find
    var nodeCount: Int {
        paths.count
    }
}

//let dj = DisjointSet(nodes: ["A", "B", "C", "D", "E"])

var disjointSet = DisjointSet<Int>()
var edges = [[1,2],[1,3],[2,3]]

for edge in edges {
    guard let nodeOne = edge.first,
          let nodeTwo = edge.last else { break }
    
    if !disjointSet.unify(nodeOne, nodeTwo) {
        print(edge)
    }
}

disjointSet = DisjointSet<Int>()
edges = [[1,2],[2,3],[3,4],[1,4],[1,5]]

for edge in edges {
    guard let nodeOne = edge.first,
          let nodeTwo = edge.last else { break }
    
    if !disjointSet.unify(nodeOne, nodeTwo) {
        print(edge)
    }
}
