//
//  Heap.swift
//  Heap
//
//  Created by Shawn Frank on 27/4/2025.
//

import Foundation

enum HeapProperty {
    case max
    case min
}

struct Heap<T: Comparable> {
    
    private var nodes = [T]()
    
    private let comparator: (T, T) -> Bool
    
    init(type: HeapProperty) {
        switch type {
        case .max: comparator = (>)
        case .min: comparator = (<)
        }
    }
    
    init(_ array: [T], type: HeapProperty) {
        self.init(type: type)
        nodes = array
        heapify()
    }
    
    mutating private func heapify() {
        for index in (0 ..< nodes.count).reversed() {
            sink(from: index)
        }
    }
    
    mutating private func bubbleUp(from index: Int) {
        guard !isEmpty, index >= 0, index < nodes.count else { return }
        
        var parentIndex = index / 2
        
        if index != 0 && index % 2 == 0 {
            parentIndex -= 1
        }
        
        let currentNode = nodes[index]
        let parentNode = nodes[parentIndex]
        
        // Node is at the correct position to satisfy the Heap invariant
        guard comparator(currentNode, parentNode) else {
            return
        }
        
        swap(indexOne: parentIndex, indexTwo: index)
        bubbleUp(from: parentIndex)
    }
    
    mutating private func sink(from index: Int) {
        guard !isEmpty, index >= 0, index < nodes.count else { return }
        
        let leftNodeIndex = 2 * index + 1
        let rightNodeIndex = 2 * index + 2
        
        // There should be no right children given this should be a complete binary tree
        guard leftNodeIndex >= 0, leftNodeIndex < nodes.count else {
            return
        }
        
        var swapCandidateIndex = leftNodeIndex
        var swapCandidateElement = nodes[leftNodeIndex]
        
        if rightNodeIndex >= 0 && rightNodeIndex < nodes.count && comparator(nodes[rightNodeIndex], swapCandidateElement) {
            swapCandidateIndex = rightNodeIndex
            swapCandidateElement = nodes[rightNodeIndex]
        }
        
        let currentNode = nodes[index]
        
        if comparator(swapCandidateElement, currentNode) {
            swap(indexOne: index, indexTwo: swapCandidateIndex)
            sink(from: swapCandidateIndex)
        }
    }
    
    mutating private func swap(indexOne: Int, indexTwo: Int) {
        guard indexOne >= 0,
              indexOne < nodes.count,
              indexTwo >= 0,
              indexTwo < nodes.count else { return }
        
        let temp = nodes[indexOne]
        nodes[indexOne] = nodes[indexTwo]
        nodes[indexTwo] = temp
    }
}

// MARK: Interface
extension Heap {
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    var count: Int {
        nodes.count
    }
    
    mutating func insert(_ element: T) {
        nodes.append(element)
        bubbleUp(from: nodes.count - 1)
    }
    
    @discardableResult mutating func poll() -> T? {
        guard let root = nodes.first else { return nil }
        
        swap(indexOne: 0, indexTwo: nodes.count - 1)
        nodes.removeLast()
        
        sink(from: 0)
        
        return root
    }
    
    func contains(_ element: T) -> Bool {
        nodes.contains(element)
    }
    
    func display() {
        print("Current Heap")
        
        print("[", terminator: "")
        
        for (index, node) in nodes.enumerated() {
            if index == nodes.count - 1 {
                print(node, terminator: "")
            } else {
                print("\(node), ", terminator: "")
            }
        }
        
        print("]")
    }
    
    mutating func sort() -> [T] {
        var result = [T]()
        
        while !nodes.isEmpty {
            guard let node = poll() else { return [] }
            
            result.append(node)
        }
        
        return result
    }
}

extension Array where Element: Comparable {
    
    enum HeapSortOrder {
        case ascending
        case descending
    }
    
    mutating func heapSort(_ order: HeapSortOrder) {
        var heapProperty = HeapProperty.max
        
        if order == .ascending {
            heapProperty = .min
        }
        
        var heap = Heap(self, type: heapProperty)
        
        self = []
        
        while !heap.isEmpty {
            guard let node = heap.poll() else { return }
            append(node)
        }
    }
}
