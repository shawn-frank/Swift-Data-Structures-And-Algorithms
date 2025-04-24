//
//  main.swift
//  567 - Permutation in string
//
//  Created by Shawn Frank on 24/4/2025.
//
//  https://leetcode.com/problems/permutation-in-string/description/
//  https://www.youtube.com/watch?v=UbyhOgBN834&ab_channel=NeetCode

import Foundation

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    guard s1.count <= s2.count else { return false }
    
    var permutationHash = [Character: Int]()
    
    s1.forEach() { character in
        permutationHash[character, default: 0] += 1
    }
    
    var leftIndex = s2.startIndex
    var rightIndex = s2.index(leftIndex, offsetBy: s1.count - 1)
    
    while rightIndex < s2.endIndex {
        
        var iteratingLeftIndex = leftIndex
        
        var comparisonPermutationHash = permutationHash
        
        while iteratingLeftIndex <= rightIndex {
            let currentCharacter = s2[iteratingLeftIndex]
            
            guard comparisonPermutationHash[currentCharacter] != nil &&
                    comparisonPermutationHash[currentCharacter, default: 0] != 0 else {
                break
            }
            
            comparisonPermutationHash[currentCharacter, default: 0] -= 1
            s2.formIndex(after: &iteratingLeftIndex)
            
            if iteratingLeftIndex > rightIndex {
                return true
            }
        }
        
        s2.formIndex(after: &leftIndex)
        s2.formIndex(after: &rightIndex)
    }
    
    return false
}

print(checkInclusion("ab", "eidbaooo"))
print(checkInclusion("ab", "eidboaoo"))
