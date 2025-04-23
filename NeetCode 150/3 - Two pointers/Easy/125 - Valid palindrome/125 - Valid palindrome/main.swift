//
//  main.swift
//  125 - Valid palindrome
//
//  Created by Shawn Frank on 23/4/2025.
//
//  https://leetcode.com/problems/valid-palindrome/description/
//  https://www.youtube.com/watch?v=jJXJ16kPFWg&ab_channel=NeetCode


import Foundation

private func isAlphaNumeric(_ char: Character) -> Bool {
    (char.isLetter && char.isASCII) || char.isNumber
}

func isPalindrome(_ s: String) -> Bool {
    var startOffset = s.startIndex
    var endOffset = s.index(s.endIndex, offsetBy: -1)
    
    while startOffset < endOffset {
        let leftPointerChar = s[startOffset]
        let rightPointerChar = s[endOffset]
        
        guard isAlphaNumeric(leftPointerChar) else {
            s.formIndex(after: &startOffset)
            continue
        }
        
        guard isAlphaNumeric(rightPointerChar) else {
            s.formIndex(before: &endOffset)
            continue
        }
        
       if rightPointerChar.lowercased() != leftPointerChar.lowercased() { return false }
        
        s.formIndex(after: &startOffset)
        s.formIndex(before: &endOffset)
    }
    
    return true
}

print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome(" "))

