//
//  main.swift
//  How Sum Tabulation
//
//  Created by Shawn Frank on 6/5/2025.
//

import Foundation

func howSum(target: Int, numbers: [Int]) -> [Int]? {
    var howSumArray: [[Int]?] = Array(repeating: nil, count: target + 1)
    
    howSumArray[0] = []
    
    for index in 0 ... target {
        
        if howSumArray[index] != nil {
            
            for number in numbers {
                
                let howSumIndex = index + number
                
                if howSumIndex < howSumArray.count {
                    howSumArray[howSumIndex] = (howSumArray[index] ?? []) + [number]
                }
            }
            
        }
    }
    
    return howSumArray[target]
}

print(howSum(target: 7, numbers: [2, 3])) // [3, 2, 2]
print(howSum(target: 7, numbers: [5, 3, 4, 7])) // [4, 3]
print(howSum(target: 7, numbers: [2, 4])) // null
print(howSum(target: 8, numbers: [2, 3, 5])) // [2, 2, 2, 2]
print(howSum(target: 300, numbers: [7, 14])) // null


