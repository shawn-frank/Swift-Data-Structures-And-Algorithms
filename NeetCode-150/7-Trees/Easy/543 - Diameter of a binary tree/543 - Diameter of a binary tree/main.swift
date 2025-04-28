//
//  main.swift
//  543 - Diameter of a binary tree
//
//  Created by Shawn Frank on 25/4/2025.
//
//  https://leetcode.com/problems/diameter-of-binary-tree/description/
//  https://www.youtube.com/watch?v=K81C31ytOZE&ab_channel=NeetCodeIO

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

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
    
    var maxConnected = 0
    
    func totalHeightOfBinaryTree(_ root: TreeNode?) -> Int {
        var leftHeight = 0
        var rightHeight = 0
        
        if root?.left != nil {
            leftHeight = 1 + totalHeightOfBinaryTree(root?.left)
        }
        
        if root?.right != nil {
            rightHeight = 1 + totalHeightOfBinaryTree(root?.right)
        }
        
        maxConnected = max(maxConnected, leftHeight + rightHeight)
        return max(leftHeight, rightHeight)
    }
    
    let _ = totalHeightOfBinaryTree(root)
    
    return maxConnected
}
