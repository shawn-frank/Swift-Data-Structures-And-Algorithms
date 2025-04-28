//
//  main.swift
//  206 - Reverse Linked List
//
//  Created by Shawn Frank on 28/4/2025.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseListArray(_ head: ListNode?) -> ListNode? {
    guard let head else { return head }
    
    var array = [ListNode]()
    var current = head
    
    while true {
        array.append(current)
        guard let next = current.next else { break }
        current = next
    }
    
    for index in (0 ..< array.count).reversed() {
        let current = array[index]
        
        let previousIndex = index - 1
        
        var previousNode: ListNode?
        if previousIndex >= 0 {
            previousNode = array[previousIndex]
        }
        
        current.next = previousNode
    }
    
    return array.last
}

func reverseListIterative(_ head: ListNode?) -> ListNode? {
    var previous: ListNode?
    var current = head
    
    while current != nil {
        let nextNode = current?.next
        current?.next = previous
        previous = current
        current = nextNode
    }
    
    return previous
}

func reverseListRecursive(_ head: ListNode?) -> ListNode? {
    var newHead: ListNode?
    
    @discardableResult func reverseListInternal(_ head: ListNode?) -> ListNode? {
        guard let head, head.next != nil else {
            newHead = head
            return newHead
        }
        
        let previous = reverseListInternal(head.next)
        previous?.next = head
        head.next = nil
        
        return head
    }
    
    reverseListInternal(head)
    
    return newHead
}


let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)
let l5 = ListNode(5)

l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5

let reversed = reverseListRecursive(l1)

var current = reversed

while current != nil {
    print(current?.val ?? Int.min)
    current = current?.next
}


