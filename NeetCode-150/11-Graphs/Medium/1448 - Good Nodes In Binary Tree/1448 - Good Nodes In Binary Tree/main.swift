//
//  main.swift
//  1448 - Good Nodes In Binary Tree
//
//  Created by Shawn Frank on 27/4/2025.
//
//  https://leetcode.com/problems/count-good-nodes-in-binary-tree/

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

func goodNodes(_ root: TreeNode?) -> Int {
    
    guard let root else { return 0 }
    
    let rootValue = root.val
    
    var goodNodes = 0
    
    func dft(from node: TreeNode?, previousMax: Int = Int.min) {
        guard let node else { return }
        
        if node.val >= previousMax {
            goodNodes += 1
        }
        
        let maxInPath = max(node.val, previousMax)
        
        dft(from: node.left, previousMax: maxInPath)
        dft(from: node.right, previousMax: maxInPath)
    }
    
    dft(from: root)
    
    return goodNodes
}

