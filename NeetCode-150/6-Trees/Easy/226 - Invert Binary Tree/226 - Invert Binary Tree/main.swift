//
//  main.swift
//  226 - Invert Binary Tree
//
//  Created by Shawn Frank on 25/4/2025.
//
//  https://leetcode.com/problems/invert-binary-tree/

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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root else { return root }
    
    let _ = invertTree(root.left)
    let _ = invertTree(root.right)
    
    let temp = root.left
    root.left = root.right
    root.right = temp
    
    return root
}

