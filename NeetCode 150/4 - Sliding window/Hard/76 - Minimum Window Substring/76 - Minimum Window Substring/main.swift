//
//  main.swift
//  76 - Minimum Window Substring
//
//  Created by Shawn Frank on 25/4/2025.
//
//  https://leetcode.com/problems/minimum-window-substring/
//  https://www.youtube.com/watch?v=jSto0O4AJbM&ab_channel=NeetCode

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    var characterHashNeeded: [Character: Int] = [:]
    var characterHashFound: [Character: Int] = [:]
    
    t.forEach {
        characterHashNeeded[$0, default: 0] += 1
    }
    
    let charactersNeeded = t.count
    var charactersFound = 0
    var currentWindowLength = 1
    
    var substringStartIndex: String.Index?
    var substringEndIndex: String.Index?
    var minSubstringLength = Int.max
    
    var leftPointer = s.startIndex
    
    for rightPointer in s.indices {
        let characterAtRightPointer = s[rightPointer]
        
        // Check if the character is required in the substring
        characterHashFound[characterAtRightPointer, default: 0] += 1
        
        if characterHashFound[characterAtRightPointer]
            == characterHashNeeded[characterAtRightPointer] {
            charactersFound += characterHashFound[characterAtRightPointer, default: 0]
        }
        
        while leftPointer <= rightPointer && charactersFound == charactersNeeded {
            let characterAtLeftPointer = s[leftPointer]
            
            // A shorter substring has been found so update the counters
            if currentWindowLength < minSubstringLength {
                minSubstringLength = currentWindowLength
                substringStartIndex = leftPointer
                substringEndIndex = rightPointer
            }
            
            // Check if the substring is no longer valid
            if let _ = characterHashFound[characterAtLeftPointer] {
                characterHashFound[characterAtLeftPointer, default: 0] -= 1
            }
            
            if characterHashFound[characterAtLeftPointer, default: 0]
                < characterHashNeeded[characterAtLeftPointer, default: 0] {
                charactersFound -= characterHashNeeded[characterAtLeftPointer, default: 0]
            }
            
            leftPointer = s.index(after: leftPointer)
            currentWindowLength -= 1
        }
        
        currentWindowLength += 1
    }
    
    if let substringStartIndex = substringStartIndex, let substringEndIndex = substringEndIndex {
        return String(s[substringStartIndex ... substringEndIndex])
    }
    
    return ""
}

print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "a"))
print(minWindow("a", "aa"))
