//
//  main.swift
//  Can Sum
//
//  Created by Shawn Frank on 5/5/2025.
//

import Foundation

func canSum(target: Int, numbers: [Int]) -> Bool {
    
    var targetMemo = [Int: Bool]()
    
    func canSumRecursive(target: Int, numbers: [Int]) -> Bool {
        if let result = targetMemo[target] {
            return result
        }
        
        if target == 0 { return true }
        
        if target < 0 { return false }
        
        for number in numbers {
            let remainder = target - number
            
            if canSumRecursive(target: remainder, numbers: numbers) {
                targetMemo[target] = true
                return true
            }
        }
        
        targetMemo[target] = false
        return false
    }
    
    return canSumRecursive(target: target, numbers: numbers)
}

print(canSum(target: 7, numbers: [2, 3])) // true
print(canSum(target: 7, numbers: [5, 3, 4, 7])) // true
print(canSum(target: 7, numbers: [2, 4])) // false
print(canSum(target: 8, numbers: [2, 3, 5])) // true
print(canSum(target: 300, numbers: [7, 14])) // false
