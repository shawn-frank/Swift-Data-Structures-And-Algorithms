//
//  main.swift
//  Best Sum
//
//  Created by Shawn Frank on 6/5/2025.
//

import Foundation

func bestSum(target: Int, numbers: [Int]) -> [Int]? {
    
    var bestSumMemo = [Int: [Int]]()
    
    func bestSumRecursive(target: Int, numbers: [Int]) -> [Int]? {
        if let sum = bestSumMemo[target] {
            return sum
        }
        
        if target == 0 { return [] }
        
        if target < 0 { return nil }
        
        var shortestCombination: [Int]?
        
        for number in numbers {
            let remaider = target - number
            
            if let sumArray = bestSumRecursive(target: remaider, numbers: numbers) {
                let newSumArray = sumArray + [number]
                
                if shortestCombination == nil {
                    shortestCombination = newSumArray
                    continue
                }
                
                guard newSumArray.count < (shortestCombination?.count ?? 0) else { continue }
                
                shortestCombination = newSumArray
            }
        }
        
        bestSumMemo[target] = shortestCombination
        return shortestCombination
    }
    
    return bestSumRecursive(target: target, numbers: numbers)
}

print(bestSum(target: 7, numbers: [5, 4, 3, 7])) // [7]
print(bestSum(target: 8, numbers: [2, 3, 5])) // [5, 3]
print(bestSum(target: 8, numbers: [1, 4, 5])) // [4, 4]
print(bestSum(target: 100, numbers: [1, 2, 5, 25])) // [25, 25, 25, 25]

