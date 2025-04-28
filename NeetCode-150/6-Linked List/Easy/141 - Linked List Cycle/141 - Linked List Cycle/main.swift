//
//  main.swift
//  141 - Linked List Cycle
//
//  Created by Shawn Frank on 28/4/2025.
//
//  https://leetcode.com/problems/linked-list-cycle/description/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    var slowPointer = head
    var fastPointer = head
    
    while slowPointer != nil && fastPointer != nil {
        slowPointer = slowPointer?.next
        fastPointer = fastPointer?.next?.next
        
        if let slowPointer, let fastPointer, slowPointer === fastPointer {
            return true
        }
    }
    
    return false
}

