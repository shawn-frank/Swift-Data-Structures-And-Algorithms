//
//  main.swift
//  Fib Tabulation
//
//  Created by Shawn Frank on 6/5/2025.
//

import Foundation

func fib(of value: Int) -> Int {
    
    guard value > 0 else { return 0 }
    
    guard value > 1 else { return 1 }
    
    var fibSequence = Array(repeating: 0, count: value + 1)
    fibSequence[1] = 1
    
    for index in 1 ..< value {
        if index + 1 < fibSequence.count {
            fibSequence[index + 1] += fibSequence[index]
        }
        
        if index + 2 < fibSequence.count {
            fibSequence[index + 2] += fibSequence[index]
        }
    }
    
    return fibSequence[value]
}


print(fib(of: 2)) // 1
print(fib(of: 5)) // 5
print(fib(of: 15)) // 610
print(fib(of: 40)) // 102334155

