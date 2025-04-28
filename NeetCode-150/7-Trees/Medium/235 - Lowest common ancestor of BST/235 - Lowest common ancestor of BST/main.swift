//
//  main.swift
//  235 - Lowest common ancestor of BST
//
//  Created by Shawn Frank on 25/4/2025.
//
//  https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/description/
//  https://www.youtube.com/watch?v=gs2LMfuOR9k&ab_channel=NeetCode

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

func lowestCommonAncestorRecursive(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root, let p, let q else { return root }
    
    if p.val < root.val && q.val < root.val {
        return lowestCommonAncestorRecursive(root.left, p, q)
    } else if p.val > root.val && q.val > root.val {
        return lowestCommonAncestorRecursive(root.right, p, q)
    }
    
    return root
}

func lowestCommonAncestorIterative(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let p, let q else { return root }
    
    var current = root
    
    while current != nil {
        if let value = current?.val, p.val < value, q.val < value {
            current = current?.left
        } else if let value = current?.val, p.val > value, q.val > value {
            current = current?.right
        } else {
            return current
        }
    }
    
    return root
}

