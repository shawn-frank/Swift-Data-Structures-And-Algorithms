//
//  main.swift
//  Can Construct
//
//  Created by Shawn Frank on 6/5/2025.
//

import Foundation

func canConstruct(_ target: String, substrings: [String]) -> Bool {
    
    var wordMemo = [String: Bool]()
    
    func canConstructRecursive(_ target: String, substrings: [String]) -> Bool {
        if let canConstruct = wordMemo[target] {
            return canConstruct
        }
        
        if target.isEmpty { return true }
        
        for substring in substrings {
            let targetSuffix = String(target.dropFirst(substring.count))
            
            if target.hasPrefix(substring) && canConstructRecursive(targetSuffix, substrings: substrings) {
                wordMemo[target] = true
                return true
            }
        }
        
        wordMemo[target] = false
        return false
    }
    
    return canConstructRecursive(target, substrings: substrings)
}

print(canConstruct("abcdef", substrings: ["ab", "abc", "cd", "def", "abcd"])) // true
print(canConstruct("skateboard", substrings: ["bo", "rd", "ate", "t", "ska", "sk", "boar"])) // false
print(canConstruct("enterapotentpot", substrings: ["a", "p", "ent", "enter", "ot", "o", "t"])) // true
print(canConstruct("eeeeeeeeeeeeeeeeeeeeeeeeef", substrings: ["e", "ee", "eee", "eeee", "eeeee", "eeeeeee"])) // false

