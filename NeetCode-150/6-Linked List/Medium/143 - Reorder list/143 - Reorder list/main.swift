//
//  main.swift
//  143 - Reorder list
//
//  Created by Shawn Frank on 16/5/2025.
//
//  https://leetcode.com/problems/reorder-list/description/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reorderList(_ head: ListNode?) {
    guard head?.next != nil,
          head?.next?.next != nil else { return }
    
    var current = head
    
    var nodes = [ListNode]()
    
    while current != nil {
        if let current {
            nodes.append(current)
        }
        
        current = current?.next
    }
    
    var leftIndex = 0
    var rightIndex = nodes.count - 1
    
    while true {
        guard leftIndex != rightIndex else {
            nodes[leftIndex].next = nil
            break
        }
        
        let leftNode = nodes[leftIndex]
        let rightNode = nodes[rightIndex]
        
        leftNode.next = rightNode
        
        guard rightIndex > leftIndex + 1 else {
            rightNode.next = nil
            break
        }
        
        rightNode.next = nodes[leftIndex + 1]
        
        leftIndex += 1
        rightIndex -= 1
    }
}
