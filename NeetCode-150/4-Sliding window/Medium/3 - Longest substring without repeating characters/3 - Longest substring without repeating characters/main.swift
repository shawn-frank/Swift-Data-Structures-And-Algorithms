//
//  main.swift
//  3 - Longest substring without repeating characters
//
//  Created by Shawn Frank on 24/4/2025.
//
//  https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
//  https://www.youtube.com/watch?v=wiGpQwVHdE0&ab_channel=NeetCode

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.count < 2 { return s.count }
    
    var maxSubstringLength = 0
    var leftIndex = s.startIndex
    var rightIndex = leftIndex
    
    var currentSubstring = ""
    var charSet = Set<Character>()
    
    while rightIndex < s.endIndex {
        let currentCharacter = s[rightIndex]
        
        // Unique character, continue the substring
        guard charSet.contains(currentCharacter) else {
            charSet.insert(currentCharacter)
            currentSubstring.append(currentCharacter)
            maxSubstringLength = max(maxSubstringLength, currentSubstring.count)
            s.formIndex(after: &rightIndex)
            continue
        }
        
        while true {
            guard let firstCharacter = currentSubstring.first else {
                return -1 // handle error
            }
            
            s.formIndex(after: &leftIndex)
            charSet.remove(firstCharacter)
            currentSubstring = String(currentSubstring.dropFirst())
            
            if firstCharacter == currentCharacter {
                break
            }
        }
    }
    
    return maxSubstringLength
}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))
print(lengthOfLongestSubstring("abcbak"))

