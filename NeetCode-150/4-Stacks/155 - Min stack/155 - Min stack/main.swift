//
//  main.swift
//  155 - Min stack
//
//  Created by Shawn Frank on 8/5/2025.
//
//  https://leetcode.com/problems/min-stack/

import Foundation

class MinStack {
    
    private var stack: [Int]
    private var minStack: [Int]
    
    init() {
        stack = []
        minStack = []
    }
    
    func push(_ val: Int) {
        stack.append(val)
        
        if minStack.isEmpty {
            minStack.append(val)
        }
        else if let currentMin = minStack.last, val <= currentMin {
            minStack.append(val)
        }
    }
    
    func pop() {
        if !stack.isEmpty {
            let top = stack.removeLast()
            
            if let currentMin = minStack.last, top == currentMin {
                _ = minStack.removeLast()
            }
        }
    }
    
    func top() -> Int {
        return stack.last ?? Int.min
    }
    
    func getMin() -> Int {
        return minStack.last ?? Int.min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */

