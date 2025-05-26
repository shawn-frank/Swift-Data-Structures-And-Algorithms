//
//  main.swift
//  83 - Remove duplicates from sorted list
//
//  Created by Shawn Frank on 26/5/2025.
//
//  https://leetcode.com/problems/remove-duplicates-from-sorted-list/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var leftPtr = head
    var rightPtr = head
    
    while rightPtr != nil {
        
        if let leftPtrValue = leftPtr?.val,
           let rightPtrValue = rightPtr?.val,
           leftPtrValue != rightPtrValue {
            leftPtr?.next = rightPtr
            leftPtr = rightPtr
            continue
        }
        
        rightPtr = rightPtr?.next
    }
    
    leftPtr?.next = nil
    return head
}

let node1 = ListNode(1)
let node2 = ListNode(1)
let node3 = ListNode(2)
let node4 = ListNode(3)
let node5 = ListNode(3)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

var current = deleteDuplicates(node1)

while current != nil {
    if let current {
        print(current.val)
    }
    
    current = current?.next
}
