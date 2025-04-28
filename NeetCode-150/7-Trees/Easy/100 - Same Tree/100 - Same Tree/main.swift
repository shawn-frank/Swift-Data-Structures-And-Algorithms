//
//  main.swift
//  100 - Same Tree
//
//  Created by Shawn Frank on 25/4/2025.
//
//  https://leetcode.com/problems/same-tree/description/
//  https://www.youtube.com/watch?v=vRbbcKXCxOw&ab_channel=NeetCode

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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    
    if (p == nil && q != nil) || (p != nil && q == nil) {
        return false
    }
    
    if p?.val != q?.val {
        return false
    }
    
    let isLeftSame = isSameTree(p?.left, q?.left)
    let isRightSame = isSameTree(p?.right, q?.right)
    
    return isLeftSame && isRightSame
}
