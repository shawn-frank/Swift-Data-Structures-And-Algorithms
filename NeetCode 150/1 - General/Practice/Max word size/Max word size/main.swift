//
//  main.swift
//  Max word size
//
//  Created by Shawn Frank on 25/4/2025.
//

import Foundation

func isValidCharacter(_ character: Character) -> Bool {
    (character.isLetter && character.isASCII) || character.isNumber
}

func getMaxWordSize(of string: String) -> Int {
    guard string.count > 1 else { return string.count }
    
    var maxWordSize = Int.min
    
    var currentWord = ""

    var leftPointer = string.startIndex

    var rightPointer = leftPointer

    while rightPointer < string.endIndex {
        
        if (string[rightPointer].isLetter && string[rightPointer].isASCII) || string[rightPointer].isNumber {
            currentWord.append(string[rightPointer])
            string.formIndex(after: &rightPointer)
            continue
        }
        
        
        maxWordSize = max(maxWordSize, currentWord.count)
        currentWord = ""
        
        while rightPointer < string.endIndex && !isValidCharacter(string[rightPointer]) {
            string.formIndex(after: &rightPointer)
        }
        
        leftPointer = rightPointer
    }
    
    return maxWordSize

}

print(getMaxWordSize(of: "hello this is bana"))
print(getMaxWordSize(of: "sha1wn 123456789 ############ should"))


