//
//  main.swift
//  20 - Valid parentheses
//
//  Created by Shawn Frank on 8/5/2025.
//
//  https://leetcode.com/problems/valid-parentheses/description/

import Foundation

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    
    for char in s {
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
            continue
        }
        
        if stack.isEmpty { return false }
        
        let top = stack.removeLast()
        
        if char == ")" && top != "(" { return false }
        if char == "]" && top != "[" { return false }
        if char == "}" && top != "{" { return false }
    }
    
    return stack.isEmpty
}

print(isValid("()")) // true
print(isValid("()[]{}")) // true
print(isValid("(]")) // false
print(isValid("([])")) // true
print(isValid("[")) // false
