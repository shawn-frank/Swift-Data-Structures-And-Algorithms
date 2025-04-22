//
//  main.swift
//  412 - FizzBuzz
//
//  Created by Shawn Frank on 22/4/2025.
//
// https://leetcode.com/problems/fizz-buzz/
// https://www.youtube.com/watch?v=ehv-Ls9Idw8

import Foundation

func fizzBuzz(_ n: Int) -> [String] {
    var output = [String]()
    
    for item in 1 ... n {
        if item % 3 == 0 && item % 5 == 0 { output.append("FizzBuzz") }
        else if item % 3 == 0 { output.append("Fizz") }
        else if item % 5 == 0 { output.append("Buzz") }
        else { output.append("\(item)") }
    }
    
    return output
}

print(fizzBuzz(3))
print(fizzBuzz(5))
print(fizzBuzz(15))

