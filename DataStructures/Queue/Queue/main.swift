//
//  main.swift
//  Queue
//
//  Created by Shawn Frank on 26/4/2025.
//

import Foundation



var queue = Queue<Int>()

print("Queue is empty: \(queue.isEmpty)")

queue.enqueue(10)
queue.enqueue(15)

print("Peek: \(queue.peek())")
print("Queue is empty: \(queue.isEmpty)")
queue.display()

queue.enqueue(-90)
queue.enqueue(30)
queue.display()


print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
