//
//  main.swift
//  49 - Group Anagrams
//
//  Created by Shawn Frank on 13/4/2025.
//
// https://leetcode.com/problems/group-anagrams/
// https://www.youtube.com/watch?v=vzdNOK2oB2E


import Foundation

// n is count of input
// m is length of string
// n * (m log m)
// Faster in swift leet code than next one (5 ms)
func groupAnagramsSort(_ strs: [String]) -> [[String]] {
    var hashmap = [String: [String]]()
    
    for str in strs {
        let sortedString = String(str.sorted())
        
        var currentResult = hashmap[sortedString, default: []]
        currentResult.append(str)
        hashmap[sortedString] = currentResult
    }
    
    return Array(hashmap.values)
}


// n is count of input
// m is length of string
// 26 * n * m
// Slower in swift - leet code (8 ms)

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var hashmap = [[Int]: [String]]()
    
    for str in strs {
        var alphabetArray = Array(repeating: 0, count: 26)
        
        for char in str.lowercased() {
            guard let currentCharacterAscii = char.asciiValue,
                  let aAscii = Character("a").asciiValue else {
                return []
            }
            
            let index = Int(currentCharacterAscii - aAscii)
            alphabetArray[index] += 1
        }
        
        var currentAnnagram = hashmap[alphabetArray, default: []]
        currentAnnagram.append(str)
        hashmap[alphabetArray] = currentAnnagram
    }
    
    return Array(hashmap.values)
}

print(groupAnagramsSort(["eat","tea","tan","ate","nat","bat"]))
print(groupAnagramsSort([""]))
print(groupAnagramsSort(["a"]))

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
print(groupAnagrams([""]))
print(groupAnagrams(["a"]))
