//
//  main.swift
//  5 - Longest palindromic substring
//
//  Created by Shawn Frank on 16/5/2025.
//
//  https://leetcode.com/problems/longest-palindromic-substring/description/

import Foundation

func longestPalindrome(_ s: String) -> String {
    var startIndex = s.startIndex
    var maxSubstring = ""
    var maxSubStringLength = 0
    
    func findLongestPalindrome(midStart: String.Index,
                               midEnd: String.Index) {
        var startIndex = midStart
        var endIndex = midEnd
        
        var currentMaxSubstringLength = 1
        
        if startIndex != endIndex {
            currentMaxSubstringLength = 2
        }
        
        while startIndex >= s.startIndex && endIndex < s.endIndex {
            guard s[startIndex] == s[endIndex] else { break }
            
            if currentMaxSubstringLength > maxSubStringLength {
                maxSubStringLength = currentMaxSubstringLength
                maxSubstring = String(s[startIndex...endIndex])
            }
            
            currentMaxSubstringLength += 2
            s.formIndex(after: &endIndex)
            
            if startIndex > s.startIndex {
                s.formIndex(before: &startIndex)
            } else {
                break
            }
        }
    }
    
    // Single character mid point
    while startIndex < s.endIndex {
        findLongestPalindrome(midStart: startIndex,
                              midEnd: startIndex)
        
        s.formIndex(after: &startIndex)
    }
    
    startIndex = s.startIndex
    
    // Double character mid point
    while startIndex < s.endIndex {
        let nextIndex = s.index(after: startIndex)
        findLongestPalindrome(midStart: startIndex,
                              midEnd: nextIndex)
        
        s.formIndex(after: &startIndex)
    }
    
    return maxSubstring
}

print(longestPalindrome("babad")) // bab or aba
print(longestPalindrome("cbbd")) // bb
print(longestPalindrome("aacabdkacaa")) // aca
