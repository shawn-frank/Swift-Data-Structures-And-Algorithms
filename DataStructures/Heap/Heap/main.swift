//
//  main.swift
//  Heap
//
//  Created by Shawn Frank on 27/4/2025.
//

var heap = Heap<Int>(type: .max)

print("Is heap empty: \(heap.isEmpty)")

heap.insert(10)
heap.insert(8)
heap.insert(90)
heap.insert(55)
heap.insert(36)

print("Is heap empty: \(heap.isEmpty)")

print("No of elements: \(heap.count)")

print("Does 90 exist: \(heap.contains(90))")

print("Does 78 exist: \(heap.contains(78))")

heap.display()

heap.poll()

heap.display()

var heapTwo = Heap([90, 35, 13, 87, 3, 2, 45], type: .min)

heapTwo.display()

var array = [8, 10, 3, 18, 11, 2]

print("Heap sort: \(array)")

array.heapSort(.ascending)
print("Ascending: \(array)")

array.heapSort(.descending)
print("Descending: \(array))")
