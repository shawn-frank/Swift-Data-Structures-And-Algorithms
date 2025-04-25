//
//  main.swift
//  2351 - first letter to appear twice
//
//  Created by Shawn Frank on 24/4/2025.
//
//  https://leetcode.com/problems/first-letter-to-appear-twice/description/

import Foundation

func repeatedCharacter(_ s: String) -> Character {
    var charSet = Set<Character>()
    
    for char in s {
        if charSet.contains(char) { return char }
        charSet.insert(char)
    }
    
    return Character("")
}

func repeatedCharacterStringIndex(_ s: String) -> Character {
    var charSet = Set<Character>()
    var currentIndex = s.startIndex
    
    while currentIndex < s.endIndex {
        let currChar = s[currentIndex]
        if charSet.contains(currChar) { return currChar }
        charSet.insert(currChar)
        s.formIndex(after: &currentIndex)
    }
    
    return Character("")
}

print(repeatedCharacter("abccbaacz"))
print(repeatedCharacterStringIndex("abccbaacz"))
