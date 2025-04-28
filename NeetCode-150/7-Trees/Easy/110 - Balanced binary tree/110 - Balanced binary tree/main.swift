//
//  main.swift
//  110 - Balanced binary tree
//
//  Created by Shawn Frank on 27/4/2025.
//
//  https://leetcode.com/problems/balanced-binary-tree/description/
//  https://www.youtube.com/watch?v=QfJsau0ItOY&ab_channel=NeetCode

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

struct SubtreeInfo {
    let isBalanced: Bool
    let maxHeight: Int
}

func isBalanced(_ root: TreeNode?) -> Bool {
    guard let root else { return true }
    
    func calculateMaxHeight(at node: TreeNode?) -> SubtreeInfo {
        guard let node else { return SubtreeInfo(isBalanced: true, maxHeight: 0) }
        
        let leftSubtreeInfo = calculateMaxHeight(at: node.left)
        let rightSubtreeInfo = calculateMaxHeight(at: node.right)
        
        guard leftSubtreeInfo.isBalanced
                && rightSubtreeInfo.isBalanced
                && abs(leftSubtreeInfo.maxHeight - rightSubtreeInfo.maxHeight) <= 1 else {
            return SubtreeInfo(isBalanced: false, maxHeight: 0)
        }
        
        let maxHeight = max(leftSubtreeInfo.maxHeight + 1,
                            rightSubtreeInfo.maxHeight + 1)
        
        return SubtreeInfo(isBalanced: true, maxHeight: maxHeight)
    }
    
    return calculateMaxHeight(at: root).isBalanced
}

