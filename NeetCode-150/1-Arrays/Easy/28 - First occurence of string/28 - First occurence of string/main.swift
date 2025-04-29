//
//  main.swift
//  28 - First occurence of string
//
//  Created by Shawn Frank on 30/4/2025.
//

import Foundation

func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle.count <= haystack.count else { return -1 }
    
    let startIndex = 0
    var currentIndex = startIndex
    
    for index in haystack.indices {
        
        var haystackIndex = index
        var hasMatched = true
        
        for needleIndex in needle.indices {
            guard haystackIndex < haystack.endIndex,
                  haystack[haystackIndex] == needle[needleIndex] else {
                hasMatched = false
                break
            }
            
            haystack.formIndex(after: &haystackIndex)
        }
        
        if hasMatched { return currentIndex }
        
        currentIndex += 1
    }
    
    return -1
}

print(strStr("mississippi", "issipi"))
print(strStr("sadbutsad", "sad"))
print(strStr("leetcode", "leeto"))
