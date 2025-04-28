//
//  main.swift
//  102 - Binary Tree Level Order Traversal
//
//  Created by Shawn Frank on 26/4/2025.
//
//  https://leetcode.com/problems/binary-tree-level-order-traversal/

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root else { return [] }
    
    // Array not O(1) when popping
    var queue = [root]
    
    var result = [[Int]]()
    
    while !queue.isEmpty {
        var currentResult = [Int]()
        
        for index in 0 ..< queue.count {
            guard let currentNode = queue.first else { return [] }
            
            currentResult.append(currentNode.val)
            
            if let left = currentNode.left {
                queue.append(left)
            }
            
            if let right = currentNode.right {
                queue.append(right)
            }
            
            queue.removeFirst()
        }
        
        result.append(currentResult)
    }
    
    return result
}

