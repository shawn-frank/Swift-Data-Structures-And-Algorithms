//
//  main.swift
//  229 - Majority Element 2
//
//  Created by Shawn Frank on 25/12/2025.
//

import Foundation

private func majorityElement(_ nums: [Int]) -> [Int] {
    var countMap = [Int: Int]() // [3: 2, 2: 1]
    var resultSet = Set<Int>() // [3]
    
    for num in nums {
        countMap[num, default: 0] += 1
        
        if countMap[num, default: 0] > (nums.count / 3) {
            resultSet.insert(num)
        }
    }
    
    return Array(resultSet)
}

func testMajorityElementLinearSpace() {
    print("\n Testing Majority Element Linear Space:")
    print(majorityElement([3,2,3])) // [3]
    print(majorityElement([1])) // [1]
    print(majorityElement([1,2])) // [1,2]
    print(majorityElement([2,2,1,3])) // [2]
    print(majorityElement([2,2,1,3,5,8,7,4])) // []
}

