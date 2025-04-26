//
//  main.swift
//  133 - Clone graph
//
//  Created by Shawn Frank on 27/4/2025.
//
//  https://leetcode.com/problems/clone-graph/submissions/1618709609/
//  https://www.youtube.com/watch?v=mQeF6bN8hMk&ab_channel=NeetCode

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

func cloneGraph(_ node: Node?) -> Node? {
    guard let node else { return nil }
    
    var cloneTable = [Int: Node]()
    
    func clone(from node: Node) -> Node {
        if let clonedNode = cloneTable[node.val] {
            return clonedNode
        }
        
        let newNode = Node(node.val)
        cloneTable[node.val] = newNode
        
        for neighbor in node.neighbors.compactMap({ $0 }) {
            newNode.neighbors.append(clone(from: neighbor))
        }
        
        return newNode
    }
    
    return clone(from: node)
}

let nodeOne = Node(1)
let nodeTwo = Node(2)
let nodeThree = Node(3)
let nodeFour = Node(4)

nodeOne.neighbors = [nodeTwo, nodeFour]
nodeTwo.neighbors = [nodeOne, nodeThree]
nodeThree.neighbors = [nodeTwo, nodeFour]
nodeFour.neighbors = [nodeOne, nodeThree]

let newGraph = cloneGraph(nodeOne)

// Add a break point and compare addresses
print()


