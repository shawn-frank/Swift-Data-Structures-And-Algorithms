//
//  HeapTester.swift
//  DataStructures
//
//  Created by Shawn Frank on 30/11/2021.
//

import Foundation

class HeapTester
{
    // Call this from your main function to test
    class func testMinBinaryHeap()
    {
        print("\n\n** Testing Min Binary Heap **")
        
        print("Initialize a new min Heap")
        var heap = Heap<Int>()
        
        var value = 1
        print("Inserting \(value) into min Heap")
        heap.insert(value)
        
        value = 15
        print("Inserting \(value) into min Heap")
        heap.insert(value)
        
        value = 0
        print("Inserting \(value) into min Heap")
        heap.insert(value)
        
        heap.displayHeapAsArray()
        
        value = 13
        print("Inserting \(value) into min Heap")
        heap.insert(value)
        
        value = 18
        print("Inserting \(value) into min Heap")
        heap.insert(value)
        
        value = 15
        print("Inserting \(value) into min Heap")
        heap.insert(value)
        
        heap.displayHeapAsArray()
        
        if let peekedObject = heap.peek()
        {
            print("Peeking heap: \(peekedObject)")
        }
        
        print("Trying to poll heap")
        if let polledObject = heap.poll()
        {
            print("Object polled: \(polledObject)")
        }
        
        
        heap.displayHeapAsArray()
        
        value = 17
        print("Trying to remove \(value)")
        if heap.remove(value)
        {
            print("\(value) successfully removed from the heap")
            heap.displayHeapAsArray()
        }
        else
        {
            print("\(value) does not exist the heap")
        }
        
        value = 13
        print("Trying to remove \(value)")
        if heap.remove(value)
        {
            print("\(value) successfully removed from the heap")
            heap.displayHeapAsArray()
        }
        else
        {
            print("\(value) does not exist the heap")
        }
        
        print("Is min heap valid: \(heap.isValidHeap())")
    }
    
    class func testMaxBinaryHeap()
    {
        print("\n\n** Testing Max Heap **")
        
        print("Initialize a new max Heap")
        var heap = Heap<Int>(withProperty: .max)
        
        var value = 1
        print("Inserting \(value) into max Heap")
        heap.insert(value)
        
        value = 15
        print("Inserting \(value) into max Heap")
        heap.insert(value)
        
        value = 0
        print("Inserting \(value) into max Heap")
        heap.insert(value)
        
        heap.displayHeapAsArray()
        
        value = 13
        print("Inserting \(value) into max Heap")
        heap.insert(value)
        
        value = 18
        print("Inserting \(value) into max Heap")
        heap.insert(value)
        
        value = 15
        print("Inserting \(value) into max Heap")
        heap.insert(value)
        
        heap.displayHeapAsArray()
        
        if let peekedObject = heap.peek()
        {
            print("Peeking heap: \(peekedObject)")
        }
        
        print("Trying to poll heap")
        if let polledObject = heap.poll()
        {
            print("Object polled: \(polledObject)")
        }
        
        heap.displayHeapAsArray()
        
        value = 17
        print("Trying to remove \(value)")
        if heap.remove(value)
        {
            print("\(value) successfully removed from the heap")
            heap.displayHeapAsArray()
        }
        else
        {
            print("\(value) does not exist the heap")
        }
        
        value = 13
        print("Trying to remove \(value)")
        if heap.remove(value)
        {
            print("\(value) successfully removed from the heap")
            heap.displayHeapAsArray()
        }
        else
        {
            print("\(value) does not exist the heap")
        }
        
        print("Is max heap valid: \(heap.isValidHeap())")
    }
    
    class func testHeapify()
    {
        print("\n\n-- SWIFT WITH HEAPIFY --")
        var originalArray = [12, 20, 15, 10, 40, 25, 18, 15]
        
        print("Trying to heapify array: \(originalArray)")
        var heap = Heap(withArray: originalArray, andHeapProperty: .min)
        heap.displayHeapAsArray()
        
        let itemToAdd = 35
        print("Trying to insert \(itemToAdd) into the heap. Heap after insert: ")
        heap.insert(itemToAdd)
        heap.displayHeapAsArray()
        
        print("Trying to poll the heap")
        if let polledValue = heap.poll()
        {
            print("Successfully polled: \(polledValue). Heap after poll:")
            heap.displayHeapAsArray()
        }
        var findElement = 18
        print("Does \(findElement) exist in the heap: \(heap.doesContain(findElement))")
        
        findElement = 20
        print("Trying to remove \(findElement) from the heap")
        if heap.remove(findElement)
        {
            print("\(findElement) removed from the heap. Heap after removal: ")
            heap.displayHeapAsArray()
        }
        
        originalArray = [12, 20, 15, 10, 40, 25, 18, 15]
        print("Trying to sort array: \(originalArray)")
        print("Sorted array in ascending order: \(Heap.sort(originalArray, sortType: .ascending))")
        print("Sorted array in descending order: \(Heap.sort(originalArray, sortType: .descending))")
    }
}
