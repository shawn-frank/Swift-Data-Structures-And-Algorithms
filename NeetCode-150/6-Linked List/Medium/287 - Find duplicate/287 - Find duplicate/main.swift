//
//  main.swift
//  287 - Find duplicate
//
//  Created by Shawn Frank on 29/4/2025.
//

import Foundation

func findDuplicate(_ nums: [Int]) -> Int {
    var fast = 0
    var slow = 0
    
    while true {
        slow = nums[slow]
        fast = nums[nums[fast]]
        
        guard slow != fast else { break }
    }
    
    var slow2 = 0
    
    while true {
        slow = nums[slow]
        slow2 = nums[slow2]
        
        guard slow != slow2 else { break }
    }
    
    return slow
}

print(findDuplicate([1,3,4,2,2]))
print(findDuplicate([3,1,3,4,2]))
print(findDuplicate([3,3,3,3,3]))

