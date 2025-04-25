//
//  Queue.swift
//  Queue
//
//  Created by Shawn Frank on 26/4/2025.
//


import Foundation

struct Queue<T> {
    private var head = -1
    private var tail = -1
    private var hashtable = [Int: T]()
    
    mutating func enqueue(_ data: T) {
        if isEmpty {
            head += 1
        }
        
        tail += 1
        hashtable[tail] = data
    }
    
    @discardableResult mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        
        let valueToRemove = hashtable[head]
        hashtable.removeValue(forKey: head)
        
        if hashtable.isEmpty {
            head = -1
            tail = head
        } else {
            head += 1
        }
        
        return valueToRemove
    }
    
    var isEmpty: Bool {
        head == -1
    }
    
    func peek() -> T? {
        guard !isEmpty else { return nil }
        return hashtable[head]
    }
    
    func display() {
        print("[ ", terminator: "")
        
        for index in head ... tail {
            if let value = hashtable[index] {
                print("\(value) ", terminator: "")
            }
        }
        
        print("]")
    }
}
