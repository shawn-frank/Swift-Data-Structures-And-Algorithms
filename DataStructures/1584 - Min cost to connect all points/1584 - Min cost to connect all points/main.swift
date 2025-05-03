//
//  main.swift
//  1584 - Min cost to connect all points
//
//  Created by Shawn Frank on 3/5/2025.
//
//  https://leetcode.com/problems/min-cost-to-connect-all-points/description/
//  https://www.youtube.com/watch?v=f7JOBJIC-NA&t=654s&ab_channel=NeetCode

import Foundation

class DisjointSet {
    var components = 0
    
    var nodeMap = [[Int]: Int]()
    
    var paths = [Int]()
    
    init(withPoints points: [[Int]]) {
        for point in points {
            nodeMap[point] = components
            paths.append(components)
            components += 1
        }
    }
    
    func findRoot(_ node: [Int]) -> Int? {
        guard var nodeIndex = nodeMap[node] else { return nil }
        
        var newRootIndex = nodeIndex
        
        while newRootIndex != paths[newRootIndex] {
            newRootIndex = paths[newRootIndex]
        }
        
        // Path compression
        while nodeIndex != newRootIndex {
            let nextIndex = paths[nodeIndex]
            paths[nodeIndex] = newRootIndex
            nodeIndex = nextIndex
        }
        
        return newRootIndex
    }
    
    @discardableResult func union(_ nodeOne: [Int], _ nodeTwo: [Int]) -> Bool {
        guard let nodeOneRootIndex = findRoot(nodeOne),
              let nodeTwoRootIndex = findRoot(nodeTwo) else {
            return false
        }
        
        guard paths[nodeOneRootIndex] != paths[nodeTwoRootIndex] else { return false }
        
        paths[nodeOneRootIndex] = paths[nodeTwoRootIndex]
        components -= 1
        
        return true
    }
}

struct Path {
    let source: CGPoint
    let destination: CGPoint
    
    var cost: Int {
        Int(abs(source.x - destination.x) + abs(source.y - destination.y))
    }
}

func minCostConnectPoints(_ points: [[Int]]) -> Int {
    var paths = [Path]()
    
    // Create the path array O(n ^ 2)
    for (index, currentPoint) in points.enumerated() {
        
        for neighbourIndex in index+1 ..< points.count {
            let neighbour = points[neighbourIndex]
            
            guard let sourceX = currentPoint.first, let sourceY = currentPoint.last,
                  let destinationX = neighbour.first, let destinationY = neighbour.last else {
                return -1
            }
            
            let source = CGPoint(x: Double(sourceX), y: Double(sourceY))
            let destination = CGPoint(x: Double(destinationX), y: Double(destinationY))
            let path = Path(source: source, destination: destination)
            paths.append(path)
        }
    }
    
    // O (n log n)
    paths = paths.sorted { $0.cost < $1.cost }
    
    let dj = DisjointSet(withPoints: points)
    
    var totalCost = 0
    
    // O (ammortized 1)
    for path in paths {
        if dj.union([Int(path.source.x), Int(path.source.y)],
                    [Int(path.destination.x), Int(path.destination.y)]) {
            print("\(path), cost: \(path.cost)")
            totalCost += path.cost
        }
        
        if dj.components == 1 {
            break
        }
    }
    
    return totalCost
}


