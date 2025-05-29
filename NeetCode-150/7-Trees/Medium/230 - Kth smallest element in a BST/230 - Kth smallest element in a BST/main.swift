//
//  main.swift
//  230 - Kth smallest element in a BST
//
//  Created by Shawn Frank on 29/5/2025.
//
//  https://leetcode.com/problems/kth-smallest-element-in-a-bst/

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

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var arr: [Int] = []
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else {
            return
        }
        
        dfs(root.left)
        
        if arr.count < k {
            arr.append(root.val)
        } else {
            return
        }
        
        dfs(root.right)
    }
    
    dfs(root)
    
    return arr.removeLast()
}

