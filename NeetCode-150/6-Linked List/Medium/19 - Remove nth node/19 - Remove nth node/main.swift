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

func removeNthFromEndRecursive(_ head: ListNode?, _ n: Int) -> ListNode? {
    // Empty list
    guard head != nil else { return head }
    
    // Used to get the node before the target to delete as we only have forward pointers
    // so we need the previous node to point to the node to be deleted's next
    var dummy: ListNode? = ListNode(0, head)
    
    var right = head
    var left = dummy
    
    // Move right till we get the correct distance
    for iteration in 1 ... n {
        right = right?.next
    }
    
    // Deleting the first element scenario
    guard right != nil else { return head?.next }
    
    // All other cases
    while right != nil {
        left = left?.next
        right = right?.next
    }
    
    left?.next = left?.next?.next
    return dummy?.next
}

