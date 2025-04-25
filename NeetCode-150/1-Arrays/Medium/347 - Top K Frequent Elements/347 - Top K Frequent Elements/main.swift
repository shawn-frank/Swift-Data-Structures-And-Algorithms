//
//  main.swift
//  347 - Top K Frequent Elements
//
//  Created by Shawn Frank on 22/4/2025.
//
// https://leetcode.com/problems/top-k-frequent-elements/description/
// https://youtu.be/YPTqKIgVk-k?si=8qa6i7ikqOTnDwlK

import Foundation

// Type of bucket sort
func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var countHashmap = [Int: Int]()
    
    for num in nums {
        countHashmap[num, default: 0] += 1
    }
    
    var result = Array(repeating: [Int](), count: nums.count + 1)
    
    for (key, value) in countHashmap {
        result[value].append(key)
    }
    
    var output = [Int]()
    
    for item in result.reversed() {
        output.append(contentsOf: item)
        
        guard output.count != k else {
            break
        }
    }
    
    return output
}

struct Pair: Comparable {
    let value: Int
    let frequency: Int
    
    static func < (lhs: Pair, rhs: Pair) -> Bool {
        lhs.frequency < rhs.frequency
    }
}

func topKFrequentSort(_ nums: [Int], _ k: Int) -> [Int] {
    var countHashmap = [Int: Int]()
    
    for num in nums {
        countHashmap[num, default: 0] += 1
    }
    
    var result = Array<Pair>()
    
    for (value, frequency) in countHashmap {
        result.append(Pair(value: value, frequency: frequency))
    }
    
    result = result.sorted()
    
    var output = [Int]()
    
    for pair in result.reversed() {
        output.append(pair.value)
        
        guard output.count != k else {
            break
        }
    }
    
    return output
}



print(topKFrequent([1,1,1,2,2,3,3,4,3], 2))
print(topKFrequent([1], 1))

print(topKFrequentSort([1,1,1,2,2,3,3,4,3], 2))
print(topKFrequentSort([1], 1))

