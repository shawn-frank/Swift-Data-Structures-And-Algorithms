//
//  main.swift
//  199 - Binary tree view
//
//  Created by Shawn Frank on 29/5/2025.
//
//  https://leetcode.com/problems/binary-tree-right-side-view/

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

func rightSideView(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var maxHeight = Int.min
    
    func dfs(_ root: TreeNode?, currentHeight: Int = 0) {
        guard let root else { return }
        
        if currentHeight + 1 > maxHeight {
            result.append(root.val)
            maxHeight = currentHeight + 1
        }
        
        dfs(root.right, currentHeight: currentHeight + 1)
        dfs(root.left, currentHeight: currentHeight + 1)
    }
    
    dfs(root)
    return result
}

