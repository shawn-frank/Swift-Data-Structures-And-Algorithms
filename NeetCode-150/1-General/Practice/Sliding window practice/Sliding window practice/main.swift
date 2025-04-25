//
//  main.swift
//  Sliding window practice
//
//  Created by Shawn Frank on 25/4/2025.
//

import Foundation

var string = "hello this is bana"

var stringLength = 0

var leftIndex = string.startIndex
var rightIndex = leftIndex

var maxSubstringLength = 4

while rightIndex < string.endIndex {
    print(string[leftIndex ... rightIndex])
    
    if string.distance(from: leftIndex, to: rightIndex) + 1 < maxSubstringLength {
        string.formIndex(after: &rightIndex)
        continue
    }
    
    print()
    
    while leftIndex < rightIndex {
        string.formIndex(after: &leftIndex)
    }
}
