//
//  main.swift
//  242 - Valid Anagram
//
//  Created by Shawn Frank on 12/4/2025.
//
// https://leetcode.com/problems/valid-anagram/description/
// https://www.youtube.com/watch?v=9UtInBqnCgA

/*
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.
 
 
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 
 Output: true
 
 Example 2:
 
 Input: s = "rat", t = "car"
 
 Output: false
 
 Constraints:
 
 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
 
 Follow up: What if the inputs contain Unicode characters?
 How would you adapt your solution to such a case?
 
 */

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    s.sorted() == t.sorted()
}

// Brute force using hashmap
// O(n) time complexity
// O(2n) space complexity
func isAnagramHashmap(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    
    var hashmapOne = [Character: Int]()
    var hashmapTwo = [Character: Int]()
    
    for index in 0 ..< s.count {
        let charOne = s[s.index(s.startIndex, offsetBy: index)]
        let charTwo = t[t.index(t.startIndex, offsetBy: index)]
        
        hashmapOne[charOne, default: 0] += 1
        hashmapTwo[charTwo, default: 0] += 1
    }
    
    return hashmapOne == hashmapTwo
}


print(isAnagram("rat", "cat"))
print(isAnagram("anagram", "nagaram"))
print(isAnagram("aacc", "ccac"))
