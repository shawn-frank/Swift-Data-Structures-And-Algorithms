//
//  MajorityElementConstantSpace.swift
//  229 - Majority Element 2
//
//  Created by Shawn Frank on 25/12/2025.
//

import Foundation

private func majorityElement(_ nums: [Int]) -> [Int] {
    
    // A bounded hashmap could be used to keep track of the candidates more elegantly
    // I used 2 variables to make it easier to understand the constant space intuition
    // This works well for n/3, however, we need to use a hashmap if we want to scale this to n/k
    
    var cand1: Int?
    var cand2: Int?
    var count1 = 0
    var count2 = 0
    
    for num in nums {
        if num == cand1 {
            count1 += 1
            continue
        }
        
        if num == cand2 {
            count2 += 1
            continue
        }
        
        if count1 == 0 {
            cand1 = num
            count1 = 1
            continue
        }
        
        if count2 == 0 {
            cand2 = num
            count2 = 1
            continue
        }
        
        count1 -= 1
        count2 -= 1
    }
    
    var result = [Int]()
    
    count1 = 0
    count2 = 0
    
    for num in nums {
        if num == cand1 { count1 += 1 }
        if num == cand2 { count2 += 1 }
    }
    
    if let cand1, count1 > nums.count / 3 { result.append(cand1) }
    if let cand2, count2 > nums.count / 3 { result.append(cand2) }
    
    return result
}

func testMajorityElementConstantSpace() {
    print("\n Testing Majority Element Constant Space:")
    print(majorityElement([3,2,3])) // [3]
    print(majorityElement([1])) // [1]
    print(majorityElement([1,2])) // [1,2]
    print(majorityElement([2,2,1,3])) // [2]
    print(majorityElement([2,2,1,3,5,8,7,4])) // []
}
