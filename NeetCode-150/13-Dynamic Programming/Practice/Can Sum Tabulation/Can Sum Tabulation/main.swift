//
//  main.swift
//  Can Sum Tabulation
//
//  Created by Shawn Frank on 6/5/2025.
//

import Foundation

func canSum(target: Int, numbers: [Int]) -> Bool {
    var canSumArray = Array(repeating: false, count: target + 1)
    
    canSumArray[0] = true
    
    for index in 0 ... target {
        for number in numbers {
            if canSumArray[index] {
                let canSumIndex = index + number
                
                if canSumIndex < canSumArray.count {
                    canSumArray[canSumIndex] = true
                }
            }
        }
    }
    
    return canSumArray[target]
}

print(canSum(target: 7, numbers: [2, 3])) // true
print(canSum(target: 7, numbers: [5, 3, 4, 7])) // true
print(canSum(target: 7, numbers: [2, 4])) // false
print(canSum(target: 8, numbers: [2, 3, 5])) // true
print(canSum(target: 300, numbers: [7, 14])) // false


