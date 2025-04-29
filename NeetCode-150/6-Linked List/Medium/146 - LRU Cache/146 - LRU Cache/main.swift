//
//  main.swift
//  146 - LRU Cache
//
//  Created by Shawn Frank on 30/4/2025.
//
//  https://leetcode.com/problems/lru-cache/description/
//  https://www.youtube.com/watch?v=7ABFKPK2hD4&ab_channel=NeetCode
//  https://www.youtube.com/watch?v=S6IfqDXWa10&ab_channel=BackToBackSWE

import Foundation

class LRUCache {

    private class Node {
        var value: Int
        var key: Int
        var next: Node?
        var previous: Node?

        init(key: Int = 0, value: Int = 0) {
            self.key = key
            self.value = value
        }
    }

    private let capacity: Int
    private var currentCapacity = 0

    private var indexHashTable = [Int: Node]()

    private var mostUsed: Node?
    private var leastUsed: Node?

    init(_ capacity: Int) {
        self.capacity = capacity
        mostUsed = Node()
        leastUsed = Node()

        mostUsed?.next = leastUsed
        leastUsed?.previous = mostUsed
    }

    private func remove(_ node: Node) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
        indexHashTable.removeValue(forKey: node.key)
        node.next = nil
        node.previous = nil
        currentCapacity -= 1
    }
    
    func get(_ key: Int) -> Int {
        guard let node = indexHashTable[key] else { return -1 }
        remove(node)
        put(node.key, node.value)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let existingNode = indexHashTable[key] {
            remove(existingNode)
        } else if currentCapacity == capacity, let nodeToRemove = leastUsed?.previous {
            remove(nodeToRemove)
        }

        currentCapacity += 1

        let newNode = Node(key: key, value: value)
        indexHashTable[key] = newNode
        newNode.next = mostUsed?.next
        newNode.previous = mostUsed
        mostUsed?.next?.previous = newNode
        mostUsed?.next = newNode
    }
}

let lruCache = LRUCache(2)
lruCache.put(1, 1) // cache is {1=1}
lruCache.put(2, 2) // cache is {1=1, 2=2}
print(lruCache.get(1)) // return 1
lruCache.put(3, 3) // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
print(lruCache.get(2)) // returns -1 (not found)
lruCache.put(4, 4) // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
print(lruCache.get(1)) // return -1 (not found)
print(lruCache.get(3)) // return 3
print(lruCache.get(4)) // return 3

/* Other cases to test
 
 
 ["LRUCache","put","put","get","put","put","get"]
 [[2],[2,1],[2,2],[2],[1,1],[4,1],[2]]
 
 ["LRUCache","get","put","get","put","put","get","get"]
 [[2],[2],[2,6],[1],[1,5],[1,2],[1],[2]]
 
 
 */
