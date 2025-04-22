//
//  main.swift
//  271 - Encode and Decode Strings
//
//  Created by Shawn Frank on 14/4/2025.
//
// https://leetcode.com/problems/encode-and-decode-strings/
// https://www.youtube.com/watch?v=B1k_sxOSgv8

import Foundation

func encode(_ strs: [String]) -> String {
    var result = ""
    let delimiter = "#"
    
    for str in strs {
        let count = str.count
        result += "\(count)\(delimiter)\(str)"
    }
    
    return result
}

func decode(_ str: String) -> [String] {
    let delimiter: Character = "#"
    var result = [String]()
    var currentIndex = str.startIndex
    
    while currentIndex < str.endIndex {
        var currentStringCharCount = ""
        
        // Get the character count of current word
        while str[currentIndex] != delimiter {
            currentStringCharCount.append(str[currentIndex])
            currentIndex = str.index(currentIndex, offsetBy: 1)
        }
        
        // Skip the delimiter
        currentIndex = str.index(currentIndex, offsetBy: 1)
        
        guard let currentStringCharCount = Int(currentStringCharCount) else {
            return []
        }
        
        let wordRange = currentIndex ..< str.index(currentIndex, offsetBy: currentStringCharCount)
        let currentWord = String(str[wordRange])
        currentIndex = str.index(currentIndex, offsetBy: currentStringCharCount)
        
        result.append(currentWord)
    }
    
    return result
}

let input = ["leet", "code", "love", "youvery$65muchthat"]

print("Input: \(input)")

let encoded = encode(input)

print("Encoded: \(encoded)")

let decoded = decode(encoded)

print("Decoded: \(decoded)")
print("Result: \(decoded == input)")
