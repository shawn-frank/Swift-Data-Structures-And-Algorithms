//
//  main.swift
//  19 - Remove nth node
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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var current = head
    
    var index = 0
    
    var hashmap = [Int: ListNode]()
    
    while current != nil {
        if let current {
            hashmap[index] = current
        }
        
        index += 1
        current = current?.next
    }
    
    guard hashmap.keys.count - n >= 0 else { return head }
    
    let indexToDelete = hashmap.keys.count - n
    
    guard indexToDelete != 0 else { return head?.next }
    
    guard let nodeToDelete = hashmap[indexToDelete],
          let previous = hashmap[indexToDelete - 1] else {
        return head
    }
    
    previous.next = nodeToDelete.next
    nodeToDelete.next = nil
    
    return head
}

