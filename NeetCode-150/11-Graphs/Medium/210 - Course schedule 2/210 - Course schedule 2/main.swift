//
//  main.swift
//  210 - Course schedule 2
//
//  Created by Shawn Frank on 28/4/2025.
//
//  https://leetcode.com/problems/course-schedule-ii/

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var graph = buildGraph(numCourses, prerequisites)
    
    var result = [Int]()
    
    var completedSet = Set<Int>()
    
    // DFS based topological sort
    func hasCycle(startingAt course: Int, visitedSet: inout Set<Int>) -> Bool {
        guard !visitedSet.contains(course) else { return true }
        
        visitedSet.insert(course)
        
        for prerequisite in graph[course, default: []] {
            if hasCycle(startingAt: prerequisite, visitedSet: &visitedSet) {
                return true
            }
        }
        
        visitedSet.remove(course)
        graph[course, default: []] = []
        
        if !completedSet.contains(course) {
            completedSet.insert(course)
            result.append(course)
        }
        
        return false
    }
    
    for course in graph.keys {
        var visitedSet = Set<Int>()
        
        if hasCycle(startingAt: course, visitedSet: &visitedSet) {
            return []
        }
    }
    
    return result
}

func buildGraph(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int: [Int]] {
    var graph = [Int: [Int]]()
    
    for course in 0 ..< numCourses {
        graph[course] = []
    }
    
    for pair in prerequisites {
        guard let course = pair.first,
              let prerequisite = pair.last else { return graph }
        
        graph[course, default: []].append(prerequisite)
    }
    
    return graph
}

// [0,1]
print(findOrder(2, [[1,0]]))

// [0,2,1,3]
print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))

// [0]
print(findOrder(1, []))
