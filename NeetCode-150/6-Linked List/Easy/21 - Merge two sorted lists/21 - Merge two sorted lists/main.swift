//
//  main.swift
//  21 - Merge two sorted lists
//
//  Created by Shawn Frank on 30/4/2025.
//
//  https://leetcode.com/problems/merge-two-sorted-lists/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    if list1 == nil { return list2 }
    if list2 == nil { return list1 }
    
    var currentList1 = list1
    var currentList2 = list2
    
    var previous: ListNode?
    var mergedHead: ListNode?
    
    while currentList1 != nil, currentList2 != nil {
        let newNode: ListNode? = ListNode()
        
        if mergedHead == nil {
            mergedHead = newNode
        }
        
        if (currentList1?.val ?? 0) < (currentList2?.val ?? 0) {
            newNode?.val = currentList1?.val ?? 0
            currentList1 = currentList1?.next
        } else {
            newNode?.val = currentList2?.val ?? 0
            currentList2 = currentList2?.next
        }
        
        previous?.next = newNode
        previous = newNode
    }
    
    while currentList1 != nil {
        let newNode = ListNode(currentList1?.val ?? 0)
        previous?.next = newNode
        previous = newNode
        
        currentList1 = currentList1?.next
    }
    
    while currentList2 != nil {
        let newNode = ListNode(currentList2?.val ?? 0)
        previous?.next = newNode
        previous = newNode
        
        currentList2 = currentList2?.next
    }
    
    return mergedHead
}

