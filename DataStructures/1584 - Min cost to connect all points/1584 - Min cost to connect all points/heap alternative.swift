//
//  heap alternative.swift
//  1584 - Min cost to connect all points
//
//  Created by Shawn Frank on 3/5/2025.
//  https://leetcode.com/problems/min-cost-to-connect-all-points/description/
//  https://www.youtube.com/watch?v=f7JOBJIC-NA&t=654s&ab_channel=NeetCode

class MinHeap {
    private var heap = [HeapPath]()
    
    func insert(_ path: HeapPath) {
        heap.append(path)
        heap = heap.sorted { $0.cost < $1.cost }
    }
    
    func poll() -> HeapPath? {
        guard let root = heap.first else { return nil }
        heap.removeFirst()
        return root
    }
    
    var isEmpty: Bool {
        heap.isEmpty
    }
}

struct HeapPath {
    let source: [Int]
    let destination: [Int]
    
    var cost: Int {
        guard let sourceX = source.first, let sourceY = source.last,
              let destinationX = destination.first, let destinationY = destination.last else { return 0 }
        
        return abs(sourceX - destinationX) + abs(sourceY - destinationY)
    }
}

func minCostConnectPointsHeap(_ points: [[Int]]) -> Int {
    var visited = Set<[Int]>()
    var minHeap = MinHeap()
    
    var currentNode = points[0]
    
    var totalCost = 0
    
    while visited.count < points.count {
        visited.insert(currentNode)
        
        for neighbour in points where neighbour != currentNode {
            guard !visited.contains(neighbour) else { continue }
            
            let distance = manhattanDistance(currentNode, neighbour)
            let path = HeapPath(source: currentNode, destination: neighbour)
            minHeap.insert(path)
        }
        
        while !minHeap.isEmpty {
            guard let nextNode = minHeap.poll() else { return -1 }
            
            guard !visited.contains(nextNode.destination) else {
                continue
            }
            
            currentNode = nextNode.destination
            totalCost += nextNode.cost
            break
        }
    }
    
    return totalCost
}

// Expects a x,y coordinate in the form of an [Int] array with 2 elements
func manhattanDistance(_ nodeOne: [Int], _ nodeTwo: [Int]) -> Int {
    guard let sourceX = nodeOne.first, let sourceY = nodeOne.last,
          let destinationX = nodeTwo.first, let destinationY = nodeTwo.last else { return 0 }
    
    return abs(sourceX - destinationX) + abs(sourceY - destinationY)
}

