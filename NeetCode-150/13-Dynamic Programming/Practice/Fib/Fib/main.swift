//
//  main.swift
//  Fib
//
//  Created by Shawn Frank on 5/5/2025.
//

import Foundation

func fib(of value: Int) -> Int {
    
    var fibMemo = [Int: Int]()
    
    func fibRecursive(of value: Int) -> Int {
        guard fibMemo[value] == nil else { return fibMemo[value, default: 0] }
        
        guard value != 0 else { return 0 }
        
        guard value > 2 else { return 1 }
        
        let result = fibRecursive(of: value - 1) + fibRecursive(of: value - 2)
        fibMemo[value] = result
        return result
    }
    
    return fibRecursive(of: value)
}


print(fib(of: 2)) // 1
print(fib(of: 5)) // 5
print(fib(of: 15)) // 610
print(fib(of: 40)) // 102334155
