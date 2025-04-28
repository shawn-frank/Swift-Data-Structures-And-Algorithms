//
//  main.swift
//  104 - Maximum Depth Binary Tree
//
//  Created by Shawn Frank on 25/4/2025.
//
//  https://leetcode.com/problems/maximum-depth-of-binary-tree/description/

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

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    
    let leftHeight = maxDepth(root.left) + 1
    let rightHeight = maxDepth(root.right) + 1
    
    return max(leftHeight, rightHeight)
}

