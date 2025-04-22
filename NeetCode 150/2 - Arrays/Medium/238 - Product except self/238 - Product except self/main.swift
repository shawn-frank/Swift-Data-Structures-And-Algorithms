//
//  main.swift
//  238 - Product except self
//
//  Created by Shawn Frank on 22/4/2025.
//  https://leetcode.com/problems/product-of-array-except-self/description/
//  https://youtu.be/bNvIQI2wAjk?si=zGX4xMjxl3UUfXZM

import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var prefix = Array(repeating: 0, count: nums.count + 1)
    var postfix = Array(repeating: 0, count: nums.count + 1)
    
    prefix[0] = 1
    postfix[nums.count] = 1
    
    for (index, num) in nums.enumerated() {
        prefix[index + 1] = prefix[index] * num
    }
    
    for index in (0 ..< nums.count).reversed() {
        let num = nums[index]
        postfix[index] = postfix[index + 1] * num
    }
    
    var output = [Int]()
    prefix = Array(prefix.dropFirst())
    postfix = postfix.dropLast()
    
    for index in 0 ..< prefix.count {
        var prefixProduct = 1
        var postfixProduct = 1
        
        if index - 1 >= 0 {
            prefixProduct = prefix[index - 1]
        }
        
        if index + 1 < prefix.count {
            postfixProduct = postfix[index + 1]
        }
        
        output.append(prefixProduct * postfixProduct)
    }
    
    return output
}

print(productExceptSelf([1,2,3,4]))
print(productExceptSelf([-1,1,0,-3,3]))
print(productExceptSelf([0,0]))

